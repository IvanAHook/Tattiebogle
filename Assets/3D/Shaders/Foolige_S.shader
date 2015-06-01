// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1135,x:32719,y:32712,varname:node_1135,prsc:2|diff-2049-RGB,normal-7013-RGB,clip-9653-R,voffset-5659-OUT;n:type:ShaderForge.SFN_Panner,id:7903,x:31788,y:33236,varname:node_7903,prsc:2,spu:0.005,spv:-0.003;n:type:ShaderForge.SFN_Tex2d,id:2755,x:32584,y:33417,ptovrint:False,ptlb:node_9619,ptin:_node_9619,varname:_node_9619,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_VertexColor,id:741,x:32023,y:33246,varname:node_741,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:9658,x:31623,y:32969,varname:node_9658,prsc:2;n:type:ShaderForge.SFN_Add,id:7922,x:31924,y:32999,varname:node_7922,prsc:2|A-9658-X,B-648-T;n:type:ShaderForge.SFN_Time,id:648,x:31623,y:33085,varname:node_648,prsc:2;n:type:ShaderForge.SFN_Sin,id:4406,x:32096,y:32999,varname:node_4406,prsc:2|IN-7922-OUT;n:type:ShaderForge.SFN_Multiply,id:2163,x:32281,y:33020,varname:node_2163,prsc:2|A-4406-OUT,B-9369-OUT,C-741-RGB;n:type:ShaderForge.SFN_Vector1,id:3626,x:31924,y:33222,varname:node_3626,prsc:2,v1:0.001;n:type:ShaderForge.SFN_NormalVector,id:2152,x:32255,y:33189,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:5659,x:32492,y:33141,varname:node_5659,prsc:2|A-2163-OUT,B-6970-OUT;n:type:ShaderForge.SFN_Tex2d,id:9653,x:31991,y:32826,ptovrint:False,ptlb:Transparancy,ptin:_Transparancy,varname:_Transparancy,prsc:2,tex:cb89008e708e4bc48a4368c06b3ff5fc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7013,x:32177,y:32732,ptovrint:False,ptlb:node_7013,ptin:_node_7013,varname:_node_7013,prsc:2,tex:9e463e1043f31724387ef30c1c366525,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:2049,x:31774,y:32766,ptovrint:False,ptlb:texture,ptin:_texture,varname:_texture,prsc:2,tex:fc79468710d144c4f87cc6209aa1c4cc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9369,x:31922,y:33178,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:_Intensity,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Vector3,id:2443,x:32456,y:33268,varname:node_2443,prsc:2,v1:1,v2:0,v3:1;n:type:ShaderForge.SFN_TexCoord,id:9529,x:32074,y:33531,varname:node_9529,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:6970,x:32310,y:33406,varname:node_6970,prsc:2|A-9529-UVOUT,B-5136-OUT;n:type:ShaderForge.SFN_Panner,id:9898,x:31809,y:33452,varname:node_9898,prsc:2,spu:1,spv:1;n:type:ShaderForge.SFN_ValueProperty,id:5136,x:31973,y:33496,ptovrint:False,ptlb:node_5136,ptin:_node_5136,varname:_node_5136,prsc:2,glob:False,v1:0;proporder:9653-7013-2049-9369-5136;pass:END;sub:END;*/

Shader "Shader Forge/Foolige" {
    Properties {
        _Transparancy ("Transparancy", 2D) = "white" {}
        _node_7013 ("node_7013", 2D) = "bump" {}
        _texture ("texture", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 0
        _node_5136 ("node_5136", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Transparancy; uniform float4 _Transparancy_ST;
            uniform sampler2D _node_7013; uniform float4 _node_7013_ST;
            uniform sampler2D _texture; uniform float4 _texture_ST;
            uniform float _Intensity;
            uniform float _node_5136;
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
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_648 = _Time + _TimeEditor;
                v.vertex.xyz += ((sin((mul(_Object2World, v.vertex).r+node_648.g))*_Intensity*o.vertexColor.rgb)*float3(o.uv0,_node_5136));
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_7013_var = UnpackNormal(tex2D(_node_7013,TRANSFORM_TEX(i.uv0, _node_7013)));
                float3 normalLocal = _node_7013_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _Transparancy_var = tex2D(_Transparancy,TRANSFORM_TEX(i.uv0, _Transparancy));
                clip(_Transparancy_var.r - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _texture_var = tex2D(_texture,TRANSFORM_TEX(i.uv0, _texture));
                float3 diffuseColor = _texture_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Transparancy; uniform float4 _Transparancy_ST;
            uniform sampler2D _node_7013; uniform float4 _node_7013_ST;
            uniform sampler2D _texture; uniform float4 _texture_ST;
            uniform float _Intensity;
            uniform float _node_5136;
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
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_648 = _Time + _TimeEditor;
                v.vertex.xyz += ((sin((mul(_Object2World, v.vertex).r+node_648.g))*_Intensity*o.vertexColor.rgb)*float3(o.uv0,_node_5136));
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_7013_var = UnpackNormal(tex2D(_node_7013,TRANSFORM_TEX(i.uv0, _node_7013)));
                float3 normalLocal = _node_7013_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _Transparancy_var = tex2D(_Transparancy,TRANSFORM_TEX(i.uv0, _Transparancy));
                clip(_Transparancy_var.r - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _texture_var = tex2D(_texture,TRANSFORM_TEX(i.uv0, _texture));
                float3 diffuseColor = _texture_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
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
            uniform float4 _TimeEditor;
            uniform sampler2D _Transparancy; uniform float4 _Transparancy_ST;
            uniform float _Intensity;
            uniform float _node_5136;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_648 = _Time + _TimeEditor;
                v.vertex.xyz += ((sin((mul(_Object2World, v.vertex).r+node_648.g))*_Intensity*o.vertexColor.rgb)*float3(o.uv0,_node_5136));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 _Transparancy_var = tex2D(_Transparancy,TRANSFORM_TEX(i.uv0, _Transparancy));
                clip(_Transparancy_var.r - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
