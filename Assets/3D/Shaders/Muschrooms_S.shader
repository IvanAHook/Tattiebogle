// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1135,x:32719,y:32712,varname:node_1135,prsc:2|emission-3764-OUT,voffset-5659-OUT;n:type:ShaderForge.SFN_Panner,id:7903,x:31788,y:33236,varname:node_7903,prsc:2,spu:0.005,spv:-0.003;n:type:ShaderForge.SFN_Tex2d,id:2755,x:32584,y:33417,ptovrint:False,ptlb:node_9619,ptin:_node_9619,varname:_node_9619,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_VertexColor,id:741,x:32023,y:33246,varname:node_741,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:9658,x:31623,y:32969,varname:node_9658,prsc:2;n:type:ShaderForge.SFN_Add,id:7922,x:31924,y:32999,varname:node_7922,prsc:2|A-9658-X,B-648-T;n:type:ShaderForge.SFN_Time,id:648,x:31623,y:33085,varname:node_648,prsc:2;n:type:ShaderForge.SFN_Sin,id:4406,x:32096,y:32999,varname:node_4406,prsc:2|IN-7922-OUT;n:type:ShaderForge.SFN_Multiply,id:2163,x:32281,y:33020,varname:node_2163,prsc:2|A-4406-OUT,B-9369-OUT,C-741-RGB;n:type:ShaderForge.SFN_Vector1,id:3626,x:31924,y:33222,varname:node_3626,prsc:2,v1:0.001;n:type:ShaderForge.SFN_NormalVector,id:2152,x:32255,y:33189,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:5659,x:32492,y:33141,varname:node_5659,prsc:2|A-2163-OUT,B-6970-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9369,x:31922,y:33178,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:_Intensity,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Vector3,id:2443,x:32456,y:33268,varname:node_2443,prsc:2,v1:1,v2:0,v3:1;n:type:ShaderForge.SFN_TexCoord,id:9529,x:32074,y:33531,varname:node_9529,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:6970,x:32310,y:33406,varname:node_6970,prsc:2|A-9529-UVOUT,B-5136-OUT;n:type:ShaderForge.SFN_Panner,id:9898,x:31809,y:33452,varname:node_9898,prsc:2,spu:1,spv:1;n:type:ShaderForge.SFN_ValueProperty,id:5136,x:31973,y:33496,ptovrint:False,ptlb:node_5136,ptin:_node_5136,varname:_node_5136,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Color,id:5769,x:32236,y:32783,ptovrint:False,ptlb:node_5769,ptin:_node_5769,varname:_node_5769,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Time,id:7824,x:31783,y:32598,varname:node_7824,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3764,x:32495,y:32772,varname:node_3764,prsc:2|A-7283-OUT,B-5769-RGB;n:type:ShaderForge.SFN_RemapRange,id:7283,x:32254,y:32598,varname:node_7283,prsc:2,frmn:-1,frmx:1,tomn:0.8,tomx:1|IN-9488-OUT;n:type:ShaderForge.SFN_Sin,id:9488,x:32005,y:32765,varname:node_9488,prsc:2|IN-7824-TDB;proporder:9369-5136-5769;pass:END;sub:END;*/

Shader "Shader Forge/Foolige" {
    Properties {
        _Intensity ("Intensity", Float ) = 0
        _node_5136 ("node_5136", Float ) = 0
        _node_5769 ("node_5769", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Intensity;
            uniform float _node_5136;
            uniform float4 _node_5769;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_648 = _Time + _TimeEditor;
                v.vertex.xyz += ((sin((mul(_Object2World, v.vertex).r+node_648.g))*_Intensity*o.vertexColor.rgb)*float3(o.uv0,_node_5136));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 node_7824 = _Time + _TimeEditor;
                float3 emissive = ((sin(node_7824.b)*0.09999999+0.9)*_node_5769.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
