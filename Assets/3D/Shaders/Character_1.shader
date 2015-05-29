// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5020,x:32712,y:32709,varname:node_5020,prsc:2|normal-2844-RGB,emission-9343-RGB,custl-1871-OUT,clip-990-R;n:type:ShaderForge.SFN_Tex2d,id:990,x:31895,y:33101,ptovrint:False,ptlb:node_990,ptin:_node_990,varname:node_990,prsc:2,tex:692aecbbaa5515841b2ad7fb8de62acc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9343,x:31938,y:32446,ptovrint:False,ptlb:node_9343,ptin:_node_9343,varname:node_9343,prsc:2,tex:b9ae68f82a5ecf04585bd93245c1251f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2844,x:32510,y:32482,ptovrint:False,ptlb:node_2844,ptin:_node_2844,varname:node_2844,prsc:2,tex:b2d2f92a5d30b8742b98ad4497a083f1,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:7069,x:31422,y:32509,varname:node_7069,prsc:2|EXP-6794-OUT;n:type:ShaderForge.SFN_Multiply,id:1761,x:32257,y:32731,varname:node_1761,prsc:2|A-9343-RGB,B-6158-OUT;n:type:ShaderForge.SFN_Lerp,id:6158,x:31945,y:32876,varname:node_6158,prsc:2|A-1842-OUT,B-7248-OUT,T-5520-OUT;n:type:ShaderForge.SFN_Multiply,id:1842,x:31678,y:32732,varname:node_1842,prsc:2|A-7069-OUT,B-3429-RGB;n:type:ShaderForge.SFN_Vector1,id:7248,x:31642,y:32843,varname:node_7248,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:5520,x:31544,y:33019,ptovrint:False,ptlb:node_5520,ptin:_node_5520,varname:node_5520,prsc:2,min:0,cur:0.1275583,max:1;n:type:ShaderForge.SFN_Cubemap,id:3429,x:31153,y:32645,ptovrint:False,ptlb:node_3429,ptin:_node_3429,varname:node_3429,prsc:2,cube:b995d4bd9d11078d11005b9844295342,pvfc:0;n:type:ShaderForge.SFN_Vector1,id:6794,x:31153,y:32460,varname:node_6794,prsc:2,v1:1;n:type:ShaderForge.SFN_LightAttenuation,id:920,x:31215,y:33114,varname:node_920,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9947,x:31475,y:33220,varname:node_9947,prsc:2|A-920-OUT,B-9638-OUT;n:type:ShaderForge.SFN_Vector1,id:9638,x:31198,y:33281,varname:node_9638,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:1871,x:32247,y:33263,varname:node_1871,prsc:2|A-9947-OUT,B-4504-RGB,C-990-G;n:type:ShaderForge.SFN_LightColor,id:4504,x:31774,y:33291,varname:node_4504,prsc:2;proporder:2844-9343-5520-3429-990;pass:END;sub:END;*/

Shader "Shader Forge/Character_1" {
    Properties {
        _node_2844 ("node_2844", 2D) = "bump" {}
        _node_9343 ("node_9343", 2D) = "white" {}
        _node_5520 ("node_5520", Range(0, 1)) = 0.1275583
        _node_3429 ("node_3429", Cube) = "_Skybox" {}
        _node_990 ("node_990", 2D) = "white" {}
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _node_990; uniform float4 _node_990_ST;
            uniform sampler2D _node_9343; uniform float4 _node_9343_ST;
            uniform sampler2D _node_2844; uniform float4 _node_2844_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
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
                float3 _node_2844_var = UnpackNormal(tex2D(_node_2844,TRANSFORM_TEX(i.uv0, _node_2844)));
                float3 normalLocal = _node_2844_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _node_990_var = tex2D(_node_990,TRANSFORM_TEX(i.uv0, _node_990));
                clip(_node_990_var.r - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _node_9343_var = tex2D(_node_9343,TRANSFORM_TEX(i.uv0, _node_9343));
                float3 emissive = _node_9343_var.rgb;
                float3 finalColor = emissive + ((attenuation*0.5)*_LightColor0.rgb*_node_990_var.g);
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _node_990; uniform float4 _node_990_ST;
            uniform sampler2D _node_9343; uniform float4 _node_9343_ST;
            uniform sampler2D _node_2844; uniform float4 _node_2844_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 _node_2844_var = UnpackNormal(tex2D(_node_2844,TRANSFORM_TEX(i.uv0, _node_2844)));
                float3 normalLocal = _node_2844_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _node_990_var = tex2D(_node_990,TRANSFORM_TEX(i.uv0, _node_990));
                clip(_node_990_var.r - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = ((attenuation*0.5)*_LightColor0.rgb*_node_990_var.g);
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
            uniform sampler2D _node_990; uniform float4 _node_990_ST;
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
                float4 _node_990_var = tex2D(_node_990,TRANSFORM_TEX(i.uv0, _node_990));
                clip(_node_990_var.r - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
