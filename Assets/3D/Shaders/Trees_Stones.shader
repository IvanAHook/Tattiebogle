// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:0,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:991,x:32719,y:32712,varname:node_991,prsc:2|diff-6948-RGB,normal-7522-RGB,alpha-2430-OUT,clip-4127-R;n:type:ShaderForge.SFN_Tex2d,id:6948,x:32189,y:32543,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_6948,prsc:2,tex:fc79468710d144c4f87cc6209aa1c4cc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7522,x:32189,y:32725,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_7522,prsc:2,tex:9e463e1043f31724387ef30c1c366525,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:4127,x:31343,y:32786,ptovrint:False,ptlb:Transp.,ptin:_Transp,varname:node_4127,prsc:2,tex:cb89008e708e4bc48a4368c06b3ff5fc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:543,x:32122,y:33112,varname:node_543,prsc:2|VAL-2900-OUT,EXP-3208-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3208,x:32122,y:33285,ptovrint:False,ptlb:Tightness,ptin:_Tightness,varname:node_6674,prsc:2,glob:False,v1:100;n:type:ShaderForge.SFN_ScreenPos,id:4209,x:31130,y:33072,varname:node_4209,prsc:2,sctp:0;n:type:ShaderForge.SFN_Length,id:8506,x:31704,y:33112,varname:node_8506,prsc:2|IN-9910-OUT;n:type:ShaderForge.SFN_Subtract,id:2900,x:31924,y:33112,varname:node_2900,prsc:2|A-8506-OUT,B-520-OUT;n:type:ShaderForge.SFN_ValueProperty,id:520,x:31704,y:33275,ptovrint:False,ptlb:Distance,ptin:_Distance,varname:node_5100,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Vector2,id:3131,x:31130,y:33244,varname:node_3131,prsc:2,v1:-0.6,v2:0;n:type:ShaderForge.SFN_Subtract,id:9910,x:31392,y:33112,varname:node_9910,prsc:2|A-4209-UVOUT,B-3131-OUT;n:type:ShaderForge.SFN_VertexColor,id:6820,x:32457,y:33286,varname:node_6820,prsc:2;n:type:ShaderForge.SFN_Lerp,id:2430,x:32457,y:33113,varname:node_2430,prsc:2|A-9030-OUT,B-1980-OUT,T-6820-R;n:type:ShaderForge.SFN_Vector1,id:1980,x:32457,y:33025,varname:node_1980,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9030,x:32122,y:32978,varname:node_9030,prsc:2|A-2086-OUT,B-543-OUT;n:type:ShaderForge.SFN_Lerp,id:2086,x:31761,y:32576,varname:node_2086,prsc:2|A-3783-OUT,B-4127-G,T-1936-OUT;n:type:ShaderForge.SFN_Vector1,id:3783,x:31472,y:32576,varname:node_3783,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:1936,x:31186,y:32630,ptovrint:False,ptlb:DepthIntensity,ptin:_DepthIntensity,varname:node_1936,prsc:2,min:0,cur:0,max:1;proporder:7522-6948-4127-3208-520-1936;pass:END;sub:END;*/

Shader "Shader Forge/Trees_Stones" {
    Properties {
        _Normal ("Normal", 2D) = "bump" {}
        _Texture ("Texture", 2D) = "white" {}
        _Transp ("Transp.", 2D) = "white" {}
        _Tightness ("Tightness", Float ) = 100
        _Distance ("Distance", Float ) = 0
        _DepthIntensity ("DepthIntensity", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Transp; uniform float4 _Transp_ST;
            uniform float _Tightness;
            uniform float _Distance;
            uniform float _DepthIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _Transp_var = tex2D(_Transp,TRANSFORM_TEX(i.uv0, _Transp));
                clip(_Transp_var.r - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,lerp((lerp(1.0,_Transp_var.g,_DepthIntensity)*pow((length((i.screenPos.rg-float2(-0.6,0)))-_Distance),_Tightness)),1.0,i.vertexColor.r));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Transp; uniform float4 _Transp_ST;
            uniform float _Tightness;
            uniform float _Distance;
            uniform float _DepthIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(6,7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _Transp_var = tex2D(_Transp,TRANSFORM_TEX(i.uv0, _Transp));
                clip(_Transp_var.r - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * lerp((lerp(1.0,_Transp_var.g,_DepthIntensity)*pow((length((i.screenPos.rg-float2(-0.6,0)))-_Distance),_Tightness)),1.0,i.vertexColor.r),0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Transp; uniform float4 _Transp_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 _Transp_var = tex2D(_Transp,TRANSFORM_TEX(i.uv0, _Transp));
                clip(_Transp_var.r - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
