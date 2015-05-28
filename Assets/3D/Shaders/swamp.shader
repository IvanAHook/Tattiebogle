// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:0,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.6397059,fgcg:0.6397059,fgcb:0.6397059,fgca:1,fgde:0.09,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3316,x:32719,y:32712,varname:node_3316,prsc:2|diff-8795-OUT,emission-5019-OUT,alpha-5017-OUT;n:type:ShaderForge.SFN_Tex2d,id:4479,x:32153,y:32711,ptovrint:False,ptlb:node_4479,ptin:_node_4479,varname:_node_4479,prsc:2,tex:8b396540438c2c2428308d0e568af891,ntxv:0,isnm:False|UVIN-733-UVOUT;n:type:ShaderForge.SFN_Panner,id:733,x:31942,y:32770,varname:node_733,prsc:2,spu:0.0001,spv:0.0001;n:type:ShaderForge.SFN_Color,id:5374,x:32080,y:32484,ptovrint:False,ptlb:1,ptin:_1,varname:_1,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8795,x:32376,y:32637,varname:node_8795,prsc:2|A-5374-RGB,B-4479-RGB;n:type:ShaderForge.SFN_Add,id:3329,x:32352,y:32525,varname:node_3329,prsc:2|A-5374-RGB,B-4479-RGB;n:type:ShaderForge.SFN_Tex2d,id:1425,x:32283,y:33047,ptovrint:False,ptlb:node_4479_copy,ptin:_node_4479_copy,varname:_node_4479_copy,prsc:2,tex:8b396540438c2c2428308d0e568af891,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5019,x:32475,y:32930,varname:node_5019,prsc:2|A-479-RGB,B-1425-RGB;n:type:ShaderForge.SFN_Color,id:479,x:32300,y:32815,ptovrint:False,ptlb:node_479,ptin:_node_479,varname:_node_479,prsc:2,glob:False,c1:11,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:2942,x:32466,y:33084,varname:node_2942,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5017,x:32462,y:32849,varname:node_5017,prsc:2,v1:0.95;proporder:4479-5374-1425-479;pass:END;sub:END;*/

Shader "Shader Forge/swaqmp" {
    Properties {
        _node_4479 ("node_4479", 2D) = "white" {}
        _1 ("1", Color) = (0.5,0.5,0.5,1)
        _node_4479_copy ("node_4479_copy", 2D) = "white" {}
        _node_479 ("node_479", Color) = (11,0.5,0.5,1)
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_4479; uniform float4 _node_4479_ST;
            uniform float4 _1;
            uniform sampler2D _node_4479_copy; uniform float4 _node_4479_copy_ST;
            uniform float4 _node_479;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
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
                float4 node_1147 = _Time + _TimeEditor;
                float2 node_733 = (i.uv0+node_1147.g*float2(0.0001,0.0001));
                float4 _node_4479_var = tex2D(_node_4479,TRANSFORM_TEX(node_733, _node_4479));
                float3 diffuseColor = (_1.rgb*_node_4479_var.rgb);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _node_4479_copy_var = tex2D(_node_4479_copy,TRANSFORM_TEX(i.uv0, _node_4479_copy));
                float3 emissive = (_node_479.rgb*_node_4479_copy_var.rgb);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,0.95);
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
            uniform float4 _TimeEditor;
            uniform sampler2D _node_4479; uniform float4 _node_4479_ST;
            uniform float4 _1;
            uniform sampler2D _node_4479_copy; uniform float4 _node_4479_copy_ST;
            uniform float4 _node_479;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 node_2061 = _Time + _TimeEditor;
                float2 node_733 = (i.uv0+node_2061.g*float2(0.0001,0.0001));
                float4 _node_4479_var = tex2D(_node_4479,TRANSFORM_TEX(node_733, _node_4479));
                float3 diffuseColor = (_1.rgb*_node_4479_var.rgb);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 0.95,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
