// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:10,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9558824,fgcg:0.5693123,fgcb:0.9292224,fgca:1,fgde:0.05,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5606,x:32947,y:32707,varname:node_5606,prsc:2|diff-5240-OUT,normal-541-OUT;n:type:ShaderForge.SFN_Tex2d,id:5262,x:32166,y:32658,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:_Texture,prsc:2,tex:f0a8168310b10da4faedc474bb26c20f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6493,x:32369,y:32897,ptovrint:False,ptlb:Grass_N,ptin:_Grass_N,varname:_Grass_N,prsc:2,tex:f0ec40764219f3f4787df1c70bacf45b,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Add,id:541,x:32765,y:32910,varname:node_541,prsc:2|A-6397-OUT,B-5859-OUT;n:type:ShaderForge.SFN_Tex2d,id:2653,x:32222,y:33097,ptovrint:False,ptlb:cLOUD,ptin:_cLOUD,varname:_cLOUD,prsc:2,tex:5b93f489c923b8e478bc5fb8b4ffb0bd,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector3,id:5444,x:32335,y:32567,varname:node_5444,prsc:2,v1:0.625,v2:0.625,v3:0.625;n:type:ShaderForge.SFN_Multiply,id:5859,x:32624,y:33058,varname:node_5859,prsc:2|A-2653-RGB,B-3742-OUT;n:type:ShaderForge.SFN_Vector1,id:3742,x:32401,y:33239,varname:node_3742,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:6397,x:32531,y:32785,varname:node_6397,prsc:2|A-1928-OUT,B-6493-RGB;n:type:ShaderForge.SFN_Vector1,id:1928,x:32431,y:32721,varname:node_1928,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5240,x:32482,y:32631,varname:node_5240,prsc:2|A-5444-OUT,B-5262-RGB;proporder:5262-6493-2653;pass:END;sub:END;*/

Shader "Shader Forge/Ground" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Grass_N ("Grass_N", 2D) = "bump" {}
        _cLOUD ("cLOUD", 2D) = "bump" {}
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Grass_N; uniform float4 _Grass_N_ST;
            uniform sampler2D _cLOUD; uniform float4 _cLOUD_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float3 _Grass_N_var = UnpackNormal(tex2D(_Grass_N,TRANSFORM_TEX(i.uv0, _Grass_N)));
                float3 _cLOUD_var = UnpackNormal(tex2D(_cLOUD,TRANSFORM_TEX(i.uv0, _cLOUD)));
                float3 normalLocal = ((1.0*_Grass_N_var.rgb)+(_cLOUD_var.rgb*1.0));
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
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 diffuseColor = (float3(0.625,0.625,0.625)*_Texture_var.rgb);
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _Grass_N; uniform float4 _Grass_N_ST;
            uniform sampler2D _cLOUD; uniform float4 _cLOUD_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float3 _Grass_N_var = UnpackNormal(tex2D(_Grass_N,TRANSFORM_TEX(i.uv0, _Grass_N)));
                float3 _cLOUD_var = UnpackNormal(tex2D(_cLOUD,TRANSFORM_TEX(i.uv0, _cLOUD)));
                float3 normalLocal = ((1.0*_Grass_N_var.rgb)+(_cLOUD_var.rgb*1.0));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 diffuseColor = (float3(0.625,0.625,0.625)*_Texture_var.rgb);
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
