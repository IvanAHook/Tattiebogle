// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:10,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5606,x:32947,y:32707,varname:node_5606,prsc:2|diff-2604-OUT,normal-9388-OUT;n:type:ShaderForge.SFN_Tex2d,id:5262,x:31809,y:33371,ptovrint:False,ptlb:Grass,ptin:_Grass,varname:_Grass,prsc:2,tex:f0a8168310b10da4faedc474bb26c20f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector3,id:5444,x:32083,y:32534,varname:node_5444,prsc:2,v1:0.625,v2:0.625,v3:0.625;n:type:ShaderForge.SFN_Multiply,id:5240,x:32349,y:32612,varname:node_5240,prsc:2|A-5444-OUT;n:type:ShaderForge.SFN_VertexColor,id:8476,x:31445,y:32987,varname:node_8476,prsc:2;n:type:ShaderForge.SFN_ChannelBlend,id:2604,x:32286,y:32821,varname:node_2604,prsc:2,chbt:1|M-8476-RGB,R-2369-RGB,G-451-RGB,B-6294-RGB,BTM-5262-RGB;n:type:ShaderForge.SFN_Tex2d,id:2369,x:31809,y:32685,ptovrint:False,ptlb:T_Dirt,ptin:_T_Dirt,varname:_T_Dirt,prsc:2,tex:82427ccdd1c743042887d869a3e05841,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:9543,x:32390,y:33263,varname:node_9543,prsc:2,chbt:1|M-8476-RGB,R-1998-RGB,G-2561-RGB,B-4834-RGB,BTM-393-RGB;n:type:ShaderForge.SFN_Tex2d,id:6294,x:31809,y:33136,ptovrint:False,ptlb:T_G&S,ptin:_T_GS,varname:_T_GS,prsc:2,tex:c76fb4718b484774e91ff3631616ec9a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Normalize,id:9388,x:32628,y:33044,varname:node_9388,prsc:2|IN-9543-OUT;n:type:ShaderForge.SFN_Tex2d,id:393,x:31896,y:34005,ptovrint:False,ptlb:N_Grass,ptin:_N_Grass,varname:_N_Grass,prsc:2,tex:f0ec40764219f3f4787df1c70bacf45b,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:1998,x:31817,y:33655,ptovrint:False,ptlb:N_Dirt,ptin:_N_Dirt,varname:_N_Dirt,prsc:2,tex:6d93c68a03993fa4198168eb5ffad660,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:451,x:31809,y:32920,ptovrint:False,ptlb:t_Moss,ptin:_t_Moss,varname:_t_Moss,prsc:2,tex:3fb06727ff1b77b47a394012b1326378,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4834,x:32208,y:34033,ptovrint:False,ptlb:N_Moss,ptin:_N_Moss,varname:_N_Moss,prsc:2,tex:32f9322402dcb1e45bf48725c0e97e07,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:2561,x:32084,y:33552,ptovrint:False,ptlb:N_G&S,ptin:_N_GS,varname:_N_GS,prsc:2,tex:c4f0726c31ac3184abb0579373958d55,ntxv:3,isnm:True;proporder:5262-2369-6294-393-1998-451-4834-2561;pass:END;sub:END;*/

Shader "Shader Forge/Ground" {
    Properties {
        _Grass ("Grass", 2D) = "white" {}
        _T_Dirt ("T_Dirt", 2D) = "white" {}
        _T_GS ("T_G&S", 2D) = "white" {}
        _N_Grass ("N_Grass", 2D) = "bump" {}
        _N_Dirt ("N_Dirt", 2D) = "bump" {}
        _t_Moss ("t_Moss", 2D) = "white" {}
        _N_Moss ("N_Moss", 2D) = "bump" {}
        _N_GS ("N_G&S", 2D) = "bump" {}
    }
    SubShader {
        Tags {
            "RenderType"="GrassBillboard"
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
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform sampler2D _T_Dirt; uniform float4 _T_Dirt_ST;
            uniform sampler2D _T_GS; uniform float4 _T_GS_ST;
            uniform sampler2D _N_Grass; uniform float4 _N_Grass_ST;
            uniform sampler2D _N_Dirt; uniform float4 _N_Dirt_ST;
            uniform sampler2D _t_Moss; uniform float4 _t_Moss_ST;
            uniform sampler2D _N_Moss; uniform float4 _N_Moss_ST;
            uniform sampler2D _N_GS; uniform float4 _N_GS_ST;
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
                float3 _N_Grass_var = UnpackNormal(tex2D(_N_Grass,TRANSFORM_TEX(i.uv0, _N_Grass)));
                float3 _N_Dirt_var = UnpackNormal(tex2D(_N_Dirt,TRANSFORM_TEX(i.uv0, _N_Dirt)));
                float3 _N_GS_var = UnpackNormal(tex2D(_N_GS,TRANSFORM_TEX(i.uv0, _N_GS)));
                float3 _N_Moss_var = UnpackNormal(tex2D(_N_Moss,TRANSFORM_TEX(i.uv0, _N_Moss)));
                float3 normalLocal = normalize((lerp( lerp( lerp( _N_Grass_var.rgb, _N_Dirt_var.rgb, i.vertexColor.rgb.r ), _N_GS_var.rgb, i.vertexColor.rgb.g ), _N_Moss_var.rgb, i.vertexColor.rgb.b )));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
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
                float4 _Grass_var = tex2D(_Grass,TRANSFORM_TEX(i.uv0, _Grass));
                float4 _T_Dirt_var = tex2D(_T_Dirt,TRANSFORM_TEX(i.uv0, _T_Dirt));
                float4 _t_Moss_var = tex2D(_t_Moss,TRANSFORM_TEX(i.uv0, _t_Moss));
                float4 _T_GS_var = tex2D(_T_GS,TRANSFORM_TEX(i.uv0, _T_GS));
                float3 diffuseColor = (lerp( lerp( lerp( _Grass_var.rgb, _T_Dirt_var.rgb, i.vertexColor.rgb.r ), _t_Moss_var.rgb, i.vertexColor.rgb.g ), _T_GS_var.rgb, i.vertexColor.rgb.b ));
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
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform sampler2D _T_Dirt; uniform float4 _T_Dirt_ST;
            uniform sampler2D _T_GS; uniform float4 _T_GS_ST;
            uniform sampler2D _N_Grass; uniform float4 _N_Grass_ST;
            uniform sampler2D _N_Dirt; uniform float4 _N_Dirt_ST;
            uniform sampler2D _t_Moss; uniform float4 _t_Moss_ST;
            uniform sampler2D _N_Moss; uniform float4 _N_Moss_ST;
            uniform sampler2D _N_GS; uniform float4 _N_GS_ST;
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
                float3 _N_Grass_var = UnpackNormal(tex2D(_N_Grass,TRANSFORM_TEX(i.uv0, _N_Grass)));
                float3 _N_Dirt_var = UnpackNormal(tex2D(_N_Dirt,TRANSFORM_TEX(i.uv0, _N_Dirt)));
                float3 _N_GS_var = UnpackNormal(tex2D(_N_GS,TRANSFORM_TEX(i.uv0, _N_GS)));
                float3 _N_Moss_var = UnpackNormal(tex2D(_N_Moss,TRANSFORM_TEX(i.uv0, _N_Moss)));
                float3 normalLocal = normalize((lerp( lerp( lerp( _N_Grass_var.rgb, _N_Dirt_var.rgb, i.vertexColor.rgb.r ), _N_GS_var.rgb, i.vertexColor.rgb.g ), _N_Moss_var.rgb, i.vertexColor.rgb.b )));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _Grass_var = tex2D(_Grass,TRANSFORM_TEX(i.uv0, _Grass));
                float4 _T_Dirt_var = tex2D(_T_Dirt,TRANSFORM_TEX(i.uv0, _T_Dirt));
                float4 _t_Moss_var = tex2D(_t_Moss,TRANSFORM_TEX(i.uv0, _t_Moss));
                float4 _T_GS_var = tex2D(_T_GS,TRANSFORM_TEX(i.uv0, _T_GS));
                float3 diffuseColor = (lerp( lerp( lerp( _Grass_var.rgb, _T_Dirt_var.rgb, i.vertexColor.rgb.r ), _t_Moss_var.rgb, i.vertexColor.rgb.g ), _T_GS_var.rgb, i.vertexColor.rgb.b ));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
