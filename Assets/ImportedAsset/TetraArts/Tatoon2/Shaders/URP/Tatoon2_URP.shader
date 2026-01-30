// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TetraArts/Tatoon2/URP/Tatoon2_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_MainTexture("MainTexture", 2D) = "white" {}
		_RimColor("Rim Color", Color) = (0,1,0.8758622,0)
		_DiffuseColor("Diffuse Color", Color) = (0.3279899,0.7075472,0.2903614,1)
		_RimBlend("Rim Blend", Range( 0 , 10)) = 0
		_ShadowSize("Shadow Size", Range( 0 , 1)) = 0.5
		[Toggle]_UseNormalMap("UseNormalMap", Float) = 0
		_ShadowBlend("ShadowBlend", Range( 0 , 1)) = 0.01
		_NormalStrength("Normal Strength", Float) = 1
		[Toggle]_Normalize("Normalize", Float) = 0
		_RimSize("Rim Size", Range( 0 , 2)) = 0.2881133
		_ShadowColor("Shadow Color", Color) = (0.6603774,0.2087042,0.2087042,1)
		[HideInInspector][Normal]_Texture0("Texture 0", 2D) = "bump" {}
		_Normal("Normal", 2D) = "bump" {}
		[NoScaleOffset]_ShadowTexture("Shadow Texture", 2D) = "white" {}
		[Toggle]_UseRim("UseRim", Float) = 1
		[Toggle]_ShadowTextureViewProjection("Shadow Texture View Projection", Float) = 1
		[Toggle]_UseGradient("Use Gradient", Float) = 0
		_ColorB("Color B", Color) = (0,0.1264467,1,0)
		_ColorA("Color A", Color) = (1,0,0,0)
		_ShadowTextureTiling("Shadow Texture Tiling", Float) = 1
		_ShadowTextureRotation("Shadow Texture Rotation", Float) = 0
		_GradientSize("Gradient Size", Range( 0 , 10)) = 0
		[Toggle]_UseShadow("UseShadow", Float) = 1
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_GradientPosition("Gradient Position", Float) = 0
		_GradientRotation("Gradient Rotation", Float) = 0
		_Metalic("Metalic", Range( 0 , 1)) = 0
		[NoScaleOffset]_RimTexture("Rim Texture", 2D) = "white" {}
		[Toggle]_UseSpecular("UseSpecular", Float) = 1
		[Toggle]_RimTextureViewProjection("Rim Texture View Projection", Float) = 0
		_RimTextureTiling("Rim Texture Tiling", Float) = 0
		[NoScaleOffset]_SpecularMap("Specular Map", 2D) = "gray" {}
		_RimTextureRotation("Rim Texture Rotation", Float) = 0
		[Toggle]_SpecularTextureViewProjection("Specular Texture View Projection", Float) = 0
		[Toggle]_RimLightColor("Rim Light Color", Float) = 1
		_SpecularTextureTiling("Specular Texture Tiling", Float) = 0
		_SpecularTextureRotation("Specular Texture Rotation", Float) = 0
		_RimLightIntensity("Rim Light Intensity", Range( 0 , 1)) = 0.2588235
		_SpecularColor("Specular Color", Color) = (0,1,0.8745098,0)
		[Toggle]_UseShadowTexture("UseShadowTexture", Float) = 0
		[Toggle]_SpecLightColor("Spec Light Color", Float) = 0
		_SpecularLightIntensity("Specular Light Intensity", Range( 0 , 10)) = 1
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.005
		_SpecularBlend("Specular Blend", Range( 0 , 1)) = 0
		[Toggle]_ChangeAxis("ChangeAxis", Float) = 1
		[Toggle]_Level2("Level2", Float) = 0
		[Toggle]_Level3("Level3", Float) = 0
		_XDirectionSpeed("XDirectionSpeed", Float) = 0
		_YDirectionSpeed("YDirectionSpeed", Float) = 0
		[Toggle]_Animate("Animate", Float) = 0
		_ShadowRamp("ShadowRamp", 2D) = "white" {}
		[Toggle]_UseRamp("UseRamp", Float) = 0
		_EmissiveMap("EmissiveMap", 2D) = "white" {}
		_Metal("Metal", 2D) = "white" {}
		[HDR]_EmissiveColor("EmissiveColor", Color) = (4,4,4,0)
		[Toggle]_UseEmissive("UseEmissive", Float) = 0
		[Toggle]_UseMetalSmooth("UseMetalSmooth", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0,0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #pragma shader_feature_local _RECEIVE_SHADOWS_OFF
            #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
            #pragma multi_compile_fog
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _CLUSTERED_RENDERING

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Texture0;
			sampler2D _Normal;
			sampler2D _MainTexture;
			sampler2D _ShadowTexture;
			sampler2D _ShadowRamp;
			sampler2D _SpecularMap;
			sampler2D _RimTexture;
			sampler2D _EmissiveMap;
			sampler2D _Metal;


			float3 MyAddLight609( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					Light light = GetAdditionalLight(i, WorldPosition);
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color +=LightingLambert(AttLightColor, light.direction, WorldNormal);
					
				}
				#endif
				return Color;
			}
			
			float3 MyAddLight2638( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				    Light light = GetAdditionalLight(i, WorldPosition);
				    half3 AttLightColor = light.color *(step(0.0001, light.distanceAttenuation) * light.shadowAttenuation);
				    half NdotL = step(0, dot(WorldNormal, light.direction));
				    half3 lighting = AttLightColor * NdotL;
				    Color += lighting ;
				    
				}
				#endif
				return Color;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.positionCS.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 color440 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float2 uv_Texture0 = IN.ase_texcoord8.xy * _Texture0_ST.xy + _Texture0_ST.zw;
				float2 texCoord192 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack188 = UnpackNormalScale( tex2D( _Normal, texCoord192 ), _NormalStrength );
				unpack188.z = lerp( 1, unpack188.z, saturate(_NormalStrength) );
				float3 NormalMap182 = (( _UseNormalMap )?( unpack188 ):( UnpackNormalScale( tex2D( _Texture0, uv_Texture0 ), 1.0f ) ));
				
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 appendResult363 = (float2(IN.ase_texcoord9.xyz.x , IN.ase_texcoord9.xyz.y));
				float2 appendResult365 = (float2(IN.ase_texcoord9.xyz.y , IN.ase_texcoord9.xyz.z));
				float cos369 = cos( radians( _GradientRotation ) );
				float sin369 = sin( radians( _GradientRotation ) );
				float2 rotator369 = mul( (( _ChangeAxis )?( appendResult365 ):( appendResult363 )) - float2( 0,0 ) , float2x2( cos369 , -sin369 , sin369 , cos369 )) + float2( 0,0 );
				float smoothstepResult375 = smoothstep( _GradientPosition , ( _GradientPosition + _GradientSize ) , rotator369.x);
				float4 lerpResult378 = lerp( _ColorA , _ColorB , smoothstepResult375);
				float2 uv_MainTexture = IN.ase_texcoord8.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
				float4 tex2DNode138 = tex2D( _MainTexture, uv_MainTexture );
				float4 Color156 = ( float4( ase_lightColor.rgb , 0.0 ) * ( (( _UseGradient )?( lerpResult378 ):( _DiffuseColor )) * tex2DNode138 ) );
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float dotResult22 = dot( normalizedWorldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float smoothstepResult28 = smoothstep( _ShadowSize , ( _ShadowSize + _ShadowBlend ) , dotResult22);
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 break149 = ( ase_lightColor.rgb * ase_lightAtten );
				float temp_output_124_0 = ( smoothstepResult28 * max( max( break149.x , break149.y ) , break149.z ) );
				float Lighting276 = temp_output_124_0;
				float clampResult505 = clamp( Lighting276 , 0.0 , 1.0 );
				float temp_output_479_0 = ( 1.0 - clampResult505 );
				float4 Texture536 = tex2DNode138;
				float2 temp_cast_2 = (_ShadowTextureTiling).xx;
				float2 texCoord231 = IN.ase_texcoord8.xy * temp_cast_2 + float2( 0,0 );
				float3 temp_output_228_0 = ( ( _ShadowTextureTiling * 1 ) * mul( UNITY_MATRIX_VP, float4( WorldViewDirection , 0.0 ) ).xyz );
				float2 appendResult394 = (float2(_XDirectionSpeed , _YDirectionSpeed));
				float2 panner391 = ( 1.0 * _Time.y * appendResult394 + temp_output_228_0.xy);
				float cos250 = cos( radians( _ShadowTextureRotation ) );
				float sin250 = sin( radians( _ShadowTextureRotation ) );
				float2 rotator250 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0.5,0.5 );
				float ShadowSize277 = _ShadowSize;
				float temp_output_239_0 = ( ShadowSize277 - -1.0 );
				float NdotL390 = dotResult22;
				float smoothstepResult252 = smoothstep( temp_output_239_0 , ( temp_output_239_0 + 0.2 ) , NdotL390);
				float cos242 = cos( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float sin242 = sin( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float2 rotator242 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos242 , -sin242 , sin242 , cos242 )) + float2( 0.5,0.5 );
				float temp_output_241_0 = ( ShadowSize277 - 0.25 );
				float smoothstepResult254 = smoothstep( temp_output_241_0 , ( temp_output_241_0 + 0.2 ) , NdotL390);
				float cos247 = cos( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float sin247 = sin( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float2 rotator247 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos247 , -sin247 , sin247 , cos247 )) + float2( 0.5,0.5 );
				float temp_output_236_0 = ( ShadowSize277 - 0.6 );
				float smoothstepResult257 = smoothstep( temp_output_236_0 , ( temp_output_236_0 + 0.2 ) , NdotL390);
				float4 temp_cast_21 = (smoothstepResult252).xxxx;
				float4 temp_cast_22 = (smoothstepResult252).xxxx;
				float4 Gradient567 = lerpResult378;
				float4 ShadowColor157 = (( _UseGradient )?( ( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) * Gradient567 ) ):( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) ));
				float2 appendResult416 = (float2(NdotL390 , 0.0));
				float2 N2417 = appendResult416;
				float ShadowMask485 = smoothstepResult28;
				float4 ShadowRamp424 = ( ( tex2D( _ShadowRamp, (N2417*0.5 + 0.5) ) * ShadowColor157 ) + ( Color156 * ShadowMask485 ) );
				float2 temp_cast_23 = (_SpecularTextureTiling).xx;
				float2 texCoord330 = IN.ase_texcoord8.xy * temp_cast_23 + float2( 0,0 );
				float cos342 = cos( radians( _SpecularTextureRotation ) );
				float sin342 = sin( radians( _SpecularTextureRotation ) );
				float2 rotator342 = mul( (( _SpecularTextureViewProjection )?( ( ( _SpecularTextureTiling * 1 ) * mul( float4( WorldViewDirection , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord330 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos342 , -sin342 , sin342 , cos342 )) + float2( 0,0 );
				float temp_output_344_0 = ( 1.0 - _SpecularSize );
				float3 normalizeResult332 = normalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 normalizeResult336 = normalize( WorldViewDirection );
				float3 normalizeResult350 = normalize( ( normalizeResult332 + normalizeResult336 ) );
				float3 normalizeResult346 = normalize( WorldNormal );
				float dotResult353 = dot( normalizeResult350 , normalizeResult346 );
				float smoothstepResult355 = smoothstep( temp_output_344_0 , ( temp_output_344_0 + _SpecularBlend ) , ( dotResult353 * Lighting276 ));
				float4 Specular359 = (( _UseSpecular )?( ( ( ( 1.0 - tex2D( _SpecularMap, rotator342 ) ) * (( _SpecLightColor )?( ( ase_lightColor * _SpecularLightIntensity ) ):( _SpecularColor )) ) * smoothstepResult355 ) ):( float4( 0,0,0,0 ) ));
				float temp_output_296_0 = ( 1.0 - _RimSize );
				float dotResult292 = dot( WorldNormal , WorldViewDirection );
				float clampResult513 = clamp( ( NdotL390 - ShadowSize277 ) , 0.0 , 1.0 );
				float smoothstepResult312 = smoothstep( temp_output_296_0 , ( temp_output_296_0 + _RimBlend ) , ( ( 1.0 - dotResult292 ) * pow( clampResult513 , 0.1 ) ));
				float2 temp_cast_28 = (_RimTextureTiling).xx;
				float2 texCoord291 = IN.ase_texcoord8.xy * temp_cast_28 + float2( 0,0 );
				float cos308 = cos( radians( _RimTextureRotation ) );
				float sin308 = sin( radians( _RimTextureRotation ) );
				float2 rotator308 = mul( (( _RimTextureViewProjection )?( ( ( _RimTextureTiling * 1 ) * mul( float4( WorldViewDirection , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord291 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos308 , -sin308 , sin308 , cos308 )) + float2( 0,0 );
				float4 Rim317 = (( _UseRim )?( ( ( saturate( smoothstepResult312 ) * Lighting276 ) * ( (( _RimLightColor )?( ( _RimLightIntensity * ase_lightColor ) ):( _RimColor )) * tex2D( _RimTexture, rotator308 ) ) ) ):( float4( 0,0,0,0 ) ));
				float2 uv_EmissiveMap = IN.ase_texcoord8.xy * _EmissiveMap_ST.xy + _EmissiveMap_ST.zw;
				float4 Emissiv453 = (( _UseEmissive )?( ( _EmissiveColor * tex2D( _EmissiveMap, uv_EmissiveMap ) ) ):( float4( 0,0,0,0 ) ));
				float3 WorldPosition609 = WorldPosition;
				float3 WorldNormal609 = WorldNormal;
				float3 localMyAddLight609 = MyAddLight609( WorldPosition609 , WorldNormal609 );
				float3 WorldPosition638 = WorldPosition;
				float3 WorldNormal638 = WorldNormal;
				float3 localMyAddLight2638 = MyAddLight2638( WorldPosition638 , WorldNormal638 );
				float3 AddLightColor520 = (( _Normalize )?( localMyAddLight2638 ):( localMyAddLight609 ));
				float4 Result195 = ( (( _UseRamp )?( ShadowRamp424 ):( ( ( ShadowColor157 * ( 1.0 - temp_output_124_0 ) ) + ( temp_output_124_0 * Color156 ) ) )) + Specular359 + Rim317 + Emissiv453 + float4( AddLightColor520 , 0.0 ) );
				
				float2 uv_Metal = IN.ase_texcoord8.xy * _Metal_ST.xy + _Metal_ST.zw;
				float4 tex2DNode456 = tex2D( _Metal, uv_Metal );
				float MetalicVar466 = (( _UseMetalSmooth )?( ( tex2DNode456.a * ( 1.0 - _Metalic ) ) ):( 1.0 ));
				
				float SmoothnessVar467 = (( _UseMetalSmooth )?( ( tex2DNode456.a * _Smoothness ) ):( 0.0 ));
				

				float3 BaseColor = color440.rgb;
				float3 Normal = NormalMap182;
				float3 Emission = Result195.rgb;
				float3 Specular = 0.5;
				float Metallic = MetalicVar466;
				float Smoothness = SmoothnessVar467;
				float Occlusion = 0.0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				#ifdef _ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += BaseColor * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += BaseColor * transmission;
						}
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += BaseColor * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += BaseColor * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #pragma multi_compile_instancing
            #pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.positionCS.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #pragma multi_compile_instancing
            #pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.positionCS.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 120107

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif


			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MainTexture;
			sampler2D _ShadowTexture;
			sampler2D _ShadowRamp;
			sampler2D _SpecularMap;
			sampler2D _RimTexture;
			sampler2D _EmissiveMap;


			float3 MyAddLight609( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					Light light = GetAdditionalLight(i, WorldPosition);
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color +=LightingLambert(AttLightColor, light.direction, WorldNormal);
					
				}
				#endif
				return Color;
			}
			
			float3 MyAddLight2638( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				    Light light = GetAdditionalLight(i, WorldPosition);
				    half3 AttLightColor = light.color *(step(0.0001, light.distanceAttenuation) * light.shadowAttenuation);
				    half NdotL = step(0, dot(WorldNormal, light.direction));
				    half3 lighting = AttLightColor * NdotL;
				    Color += lighting ;
				    
				}
				#endif
				return Color;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				
				o.ase_texcoord4 = v.positionOS;
				o.ase_texcoord5.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 color440 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 appendResult363 = (float2(IN.ase_texcoord4.xyz.x , IN.ase_texcoord4.xyz.y));
				float2 appendResult365 = (float2(IN.ase_texcoord4.xyz.y , IN.ase_texcoord4.xyz.z));
				float cos369 = cos( radians( _GradientRotation ) );
				float sin369 = sin( radians( _GradientRotation ) );
				float2 rotator369 = mul( (( _ChangeAxis )?( appendResult365 ):( appendResult363 )) - float2( 0,0 ) , float2x2( cos369 , -sin369 , sin369 , cos369 )) + float2( 0,0 );
				float smoothstepResult375 = smoothstep( _GradientPosition , ( _GradientPosition + _GradientSize ) , rotator369.x);
				float4 lerpResult378 = lerp( _ColorA , _ColorB , smoothstepResult375);
				float2 uv_MainTexture = IN.ase_texcoord5.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
				float4 tex2DNode138 = tex2D( _MainTexture, uv_MainTexture );
				float4 Color156 = ( float4( ase_lightColor.rgb , 0.0 ) * ( (( _UseGradient )?( lerpResult378 ):( _DiffuseColor )) * tex2DNode138 ) );
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float dotResult22 = dot( normalizedWorldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float smoothstepResult28 = smoothstep( _ShadowSize , ( _ShadowSize + _ShadowBlend ) , dotResult22);
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 break149 = ( ase_lightColor.rgb * ase_lightAtten );
				float temp_output_124_0 = ( smoothstepResult28 * max( max( break149.x , break149.y ) , break149.z ) );
				float Lighting276 = temp_output_124_0;
				float clampResult505 = clamp( Lighting276 , 0.0 , 1.0 );
				float temp_output_479_0 = ( 1.0 - clampResult505 );
				float4 Texture536 = tex2DNode138;
				float2 temp_cast_2 = (_ShadowTextureTiling).xx;
				float2 texCoord231 = IN.ase_texcoord5.xy * temp_cast_2 + float2( 0,0 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 temp_output_228_0 = ( ( _ShadowTextureTiling * 1 ) * mul( UNITY_MATRIX_VP, float4( ase_worldViewDir , 0.0 ) ).xyz );
				float2 appendResult394 = (float2(_XDirectionSpeed , _YDirectionSpeed));
				float2 panner391 = ( 1.0 * _Time.y * appendResult394 + temp_output_228_0.xy);
				float cos250 = cos( radians( _ShadowTextureRotation ) );
				float sin250 = sin( radians( _ShadowTextureRotation ) );
				float2 rotator250 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0.5,0.5 );
				float ShadowSize277 = _ShadowSize;
				float temp_output_239_0 = ( ShadowSize277 - -1.0 );
				float NdotL390 = dotResult22;
				float smoothstepResult252 = smoothstep( temp_output_239_0 , ( temp_output_239_0 + 0.2 ) , NdotL390);
				float cos242 = cos( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float sin242 = sin( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float2 rotator242 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos242 , -sin242 , sin242 , cos242 )) + float2( 0.5,0.5 );
				float temp_output_241_0 = ( ShadowSize277 - 0.25 );
				float smoothstepResult254 = smoothstep( temp_output_241_0 , ( temp_output_241_0 + 0.2 ) , NdotL390);
				float cos247 = cos( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float sin247 = sin( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float2 rotator247 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos247 , -sin247 , sin247 , cos247 )) + float2( 0.5,0.5 );
				float temp_output_236_0 = ( ShadowSize277 - 0.6 );
				float smoothstepResult257 = smoothstep( temp_output_236_0 , ( temp_output_236_0 + 0.2 ) , NdotL390);
				float4 temp_cast_21 = (smoothstepResult252).xxxx;
				float4 temp_cast_22 = (smoothstepResult252).xxxx;
				float4 Gradient567 = lerpResult378;
				float4 ShadowColor157 = (( _UseGradient )?( ( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) * Gradient567 ) ):( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) ));
				float2 appendResult416 = (float2(NdotL390 , 0.0));
				float2 N2417 = appendResult416;
				float ShadowMask485 = smoothstepResult28;
				float4 ShadowRamp424 = ( ( tex2D( _ShadowRamp, (N2417*0.5 + 0.5) ) * ShadowColor157 ) + ( Color156 * ShadowMask485 ) );
				float2 temp_cast_23 = (_SpecularTextureTiling).xx;
				float2 texCoord330 = IN.ase_texcoord5.xy * temp_cast_23 + float2( 0,0 );
				float cos342 = cos( radians( _SpecularTextureRotation ) );
				float sin342 = sin( radians( _SpecularTextureRotation ) );
				float2 rotator342 = mul( (( _SpecularTextureViewProjection )?( ( ( _SpecularTextureTiling * 1 ) * mul( float4( ase_worldViewDir , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord330 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos342 , -sin342 , sin342 , cos342 )) + float2( 0,0 );
				float temp_output_344_0 = ( 1.0 - _SpecularSize );
				float3 normalizeResult332 = normalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 normalizeResult336 = normalize( ase_worldViewDir );
				float3 normalizeResult350 = normalize( ( normalizeResult332 + normalizeResult336 ) );
				float3 normalizeResult346 = normalize( ase_worldNormal );
				float dotResult353 = dot( normalizeResult350 , normalizeResult346 );
				float smoothstepResult355 = smoothstep( temp_output_344_0 , ( temp_output_344_0 + _SpecularBlend ) , ( dotResult353 * Lighting276 ));
				float4 Specular359 = (( _UseSpecular )?( ( ( ( 1.0 - tex2D( _SpecularMap, rotator342 ) ) * (( _SpecLightColor )?( ( ase_lightColor * _SpecularLightIntensity ) ):( _SpecularColor )) ) * smoothstepResult355 ) ):( float4( 0,0,0,0 ) ));
				float temp_output_296_0 = ( 1.0 - _RimSize );
				float dotResult292 = dot( ase_worldNormal , ase_worldViewDir );
				float clampResult513 = clamp( ( NdotL390 - ShadowSize277 ) , 0.0 , 1.0 );
				float smoothstepResult312 = smoothstep( temp_output_296_0 , ( temp_output_296_0 + _RimBlend ) , ( ( 1.0 - dotResult292 ) * pow( clampResult513 , 0.1 ) ));
				float2 temp_cast_28 = (_RimTextureTiling).xx;
				float2 texCoord291 = IN.ase_texcoord5.xy * temp_cast_28 + float2( 0,0 );
				float cos308 = cos( radians( _RimTextureRotation ) );
				float sin308 = sin( radians( _RimTextureRotation ) );
				float2 rotator308 = mul( (( _RimTextureViewProjection )?( ( ( _RimTextureTiling * 1 ) * mul( float4( ase_worldViewDir , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord291 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos308 , -sin308 , sin308 , cos308 )) + float2( 0,0 );
				float4 Rim317 = (( _UseRim )?( ( ( saturate( smoothstepResult312 ) * Lighting276 ) * ( (( _RimLightColor )?( ( _RimLightIntensity * ase_lightColor ) ):( _RimColor )) * tex2D( _RimTexture, rotator308 ) ) ) ):( float4( 0,0,0,0 ) ));
				float2 uv_EmissiveMap = IN.ase_texcoord5.xy * _EmissiveMap_ST.xy + _EmissiveMap_ST.zw;
				float4 Emissiv453 = (( _UseEmissive )?( ( _EmissiveColor * tex2D( _EmissiveMap, uv_EmissiveMap ) ) ):( float4( 0,0,0,0 ) ));
				float3 WorldPosition609 = WorldPosition;
				float3 WorldNormal609 = ase_worldNormal;
				float3 localMyAddLight609 = MyAddLight609( WorldPosition609 , WorldNormal609 );
				float3 WorldPosition638 = WorldPosition;
				float3 WorldNormal638 = ase_worldNormal;
				float3 localMyAddLight2638 = MyAddLight2638( WorldPosition638 , WorldNormal638 );
				float3 AddLightColor520 = (( _Normalize )?( localMyAddLight2638 ):( localMyAddLight609 ));
				float4 Result195 = ( (( _UseRamp )?( ShadowRamp424 ):( ( ( ShadowColor157 * ( 1.0 - temp_output_124_0 ) ) + ( temp_output_124_0 * Color156 ) ) )) + Specular359 + Rim317 + Emissiv453 + float4( AddLightColor520 , 0.0 ) );
				

				float3 BaseColor = color440.rgb;
				float3 Emission = Result195.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #pragma multi_compile_instancing
            #pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Texture0;
			sampler2D _Normal;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_Texture0 = IN.ase_texcoord5.xy * _Texture0_ST.xy + _Texture0_ST.zw;
				float2 texCoord192 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack188 = UnpackNormalScale( tex2D( _Normal, texCoord192 ), _NormalStrength );
				unpack188.z = lerp( 1, unpack188.z, saturate(_NormalStrength) );
				float3 NormalMap182 = (( _UseNormalMap )?( unpack188 ):( UnpackNormalScale( tex2D( _Texture0, uv_Texture0 ), 1.0f ) ));
				

				float3 Normal = NormalMap182;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.positionCS.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					return half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					return half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #pragma shader_feature_local _RECEIVE_SHADOWS_OFF
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
            #pragma multi_compile_fog
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _Texture0;
			sampler2D _Normal;
			sampler2D _MainTexture;
			sampler2D _ShadowTexture;
			sampler2D _ShadowRamp;
			sampler2D _SpecularMap;
			sampler2D _RimTexture;
			sampler2D _EmissiveMap;
			sampler2D _Metal;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float3 MyAddLight609( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					Light light = GetAdditionalLight(i, WorldPosition);
					half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation);
					Color +=LightingLambert(AttLightColor, light.direction, WorldNormal);
					
				}
				#endif
				return Color;
			}
			
			float3 MyAddLight2638( float3 WorldPosition, float3 WorldNormal )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				    Light light = GetAdditionalLight(i, WorldPosition);
				    half3 AttLightColor = light.color *(step(0.0001, light.distanceAttenuation) * light.shadowAttenuation);
				    half NdotL = step(0, dot(WorldNormal, light.direction));
				    half3 lighting = AttLightColor * NdotL;
				    Color += lighting ;
				    
				}
				#endif
				return Color;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord9 = v.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.positionCS.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 color440 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float2 uv_Texture0 = IN.ase_texcoord8.xy * _Texture0_ST.xy + _Texture0_ST.zw;
				float2 texCoord192 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack188 = UnpackNormalScale( tex2D( _Normal, texCoord192 ), _NormalStrength );
				unpack188.z = lerp( 1, unpack188.z, saturate(_NormalStrength) );
				float3 NormalMap182 = (( _UseNormalMap )?( unpack188 ):( UnpackNormalScale( tex2D( _Texture0, uv_Texture0 ), 1.0f ) ));
				
				float ase_lightIntensity = max( max( _MainLightColor.r, _MainLightColor.g ), _MainLightColor.b );
				float4 ase_lightColor = float4( _MainLightColor.rgb / ase_lightIntensity, ase_lightIntensity );
				float2 appendResult363 = (float2(IN.ase_texcoord9.xyz.x , IN.ase_texcoord9.xyz.y));
				float2 appendResult365 = (float2(IN.ase_texcoord9.xyz.y , IN.ase_texcoord9.xyz.z));
				float cos369 = cos( radians( _GradientRotation ) );
				float sin369 = sin( radians( _GradientRotation ) );
				float2 rotator369 = mul( (( _ChangeAxis )?( appendResult365 ):( appendResult363 )) - float2( 0,0 ) , float2x2( cos369 , -sin369 , sin369 , cos369 )) + float2( 0,0 );
				float smoothstepResult375 = smoothstep( _GradientPosition , ( _GradientPosition + _GradientSize ) , rotator369.x);
				float4 lerpResult378 = lerp( _ColorA , _ColorB , smoothstepResult375);
				float2 uv_MainTexture = IN.ase_texcoord8.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
				float4 tex2DNode138 = tex2D( _MainTexture, uv_MainTexture );
				float4 Color156 = ( float4( ase_lightColor.rgb , 0.0 ) * ( (( _UseGradient )?( lerpResult378 ):( _DiffuseColor )) * tex2DNode138 ) );
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float dotResult22 = dot( normalizedWorldNormal , SafeNormalize(_MainLightPosition.xyz) );
				float smoothstepResult28 = smoothstep( _ShadowSize , ( _ShadowSize + _ShadowBlend ) , dotResult22);
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float3 break149 = ( ase_lightColor.rgb * ase_lightAtten );
				float temp_output_124_0 = ( smoothstepResult28 * max( max( break149.x , break149.y ) , break149.z ) );
				float Lighting276 = temp_output_124_0;
				float clampResult505 = clamp( Lighting276 , 0.0 , 1.0 );
				float temp_output_479_0 = ( 1.0 - clampResult505 );
				float4 Texture536 = tex2DNode138;
				float2 temp_cast_2 = (_ShadowTextureTiling).xx;
				float2 texCoord231 = IN.ase_texcoord8.xy * temp_cast_2 + float2( 0,0 );
				float3 temp_output_228_0 = ( ( _ShadowTextureTiling * 1 ) * mul( UNITY_MATRIX_VP, float4( WorldViewDirection , 0.0 ) ).xyz );
				float2 appendResult394 = (float2(_XDirectionSpeed , _YDirectionSpeed));
				float2 panner391 = ( 1.0 * _Time.y * appendResult394 + temp_output_228_0.xy);
				float cos250 = cos( radians( _ShadowTextureRotation ) );
				float sin250 = sin( radians( _ShadowTextureRotation ) );
				float2 rotator250 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos250 , -sin250 , sin250 , cos250 )) + float2( 0.5,0.5 );
				float ShadowSize277 = _ShadowSize;
				float temp_output_239_0 = ( ShadowSize277 - -1.0 );
				float NdotL390 = dotResult22;
				float smoothstepResult252 = smoothstep( temp_output_239_0 , ( temp_output_239_0 + 0.2 ) , NdotL390);
				float cos242 = cos( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float sin242 = sin( radians( ( _ShadowTextureRotation + 90.0 ) ) );
				float2 rotator242 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos242 , -sin242 , sin242 , cos242 )) + float2( 0.5,0.5 );
				float temp_output_241_0 = ( ShadowSize277 - 0.25 );
				float smoothstepResult254 = smoothstep( temp_output_241_0 , ( temp_output_241_0 + 0.2 ) , NdotL390);
				float cos247 = cos( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float sin247 = sin( radians( ( _ShadowTextureRotation + 45.0 ) ) );
				float2 rotator247 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner391 ,  0.0 ) ):( temp_output_228_0 )) ):( float3( texCoord231 ,  0.0 ) )).xy - float2( 0.5,0.5 ) , float2x2( cos247 , -sin247 , sin247 , cos247 )) + float2( 0.5,0.5 );
				float temp_output_236_0 = ( ShadowSize277 - 0.6 );
				float smoothstepResult257 = smoothstep( temp_output_236_0 , ( temp_output_236_0 + 0.2 ) , NdotL390);
				float4 temp_cast_21 = (smoothstepResult252).xxxx;
				float4 temp_cast_22 = (smoothstepResult252).xxxx;
				float4 Gradient567 = lerpResult378;
				float4 ShadowColor157 = (( _UseGradient )?( ( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) * Gradient567 ) ):( (( _UseShadow )?( (( _UseShadowTexture )?( ( ( Texture536 * ( ( _ShadowColor * ( temp_output_479_0 * ( ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator250 ) ) * ( 1.0 - smoothstepResult252 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator242 ) ) * ( 1.0 - smoothstepResult254 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator247 ) ) * ( 1.0 - smoothstepResult257 ) ) ):( float4( 0,0,0,0 ) )) ) ) - temp_cast_21 ) ) ) + clampResult505 ) ) * Color156 ) ):( ( Color156 * ( ( ( _ShadowColor * temp_output_479_0 ) + clampResult505 ) * Texture536 ) ) )) ):( Color156 )) ));
				float2 appendResult416 = (float2(NdotL390 , 0.0));
				float2 N2417 = appendResult416;
				float ShadowMask485 = smoothstepResult28;
				float4 ShadowRamp424 = ( ( tex2D( _ShadowRamp, (N2417*0.5 + 0.5) ) * ShadowColor157 ) + ( Color156 * ShadowMask485 ) );
				float2 temp_cast_23 = (_SpecularTextureTiling).xx;
				float2 texCoord330 = IN.ase_texcoord8.xy * temp_cast_23 + float2( 0,0 );
				float cos342 = cos( radians( _SpecularTextureRotation ) );
				float sin342 = sin( radians( _SpecularTextureRotation ) );
				float2 rotator342 = mul( (( _SpecularTextureViewProjection )?( ( ( _SpecularTextureTiling * 1 ) * mul( float4( WorldViewDirection , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord330 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos342 , -sin342 , sin342 , cos342 )) + float2( 0,0 );
				float temp_output_344_0 = ( 1.0 - _SpecularSize );
				float3 normalizeResult332 = normalize( SafeNormalize(_MainLightPosition.xyz) );
				float3 normalizeResult336 = normalize( WorldViewDirection );
				float3 normalizeResult350 = normalize( ( normalizeResult332 + normalizeResult336 ) );
				float3 normalizeResult346 = normalize( WorldNormal );
				float dotResult353 = dot( normalizeResult350 , normalizeResult346 );
				float smoothstepResult355 = smoothstep( temp_output_344_0 , ( temp_output_344_0 + _SpecularBlend ) , ( dotResult353 * Lighting276 ));
				float4 Specular359 = (( _UseSpecular )?( ( ( ( 1.0 - tex2D( _SpecularMap, rotator342 ) ) * (( _SpecLightColor )?( ( ase_lightColor * _SpecularLightIntensity ) ):( _SpecularColor )) ) * smoothstepResult355 ) ):( float4( 0,0,0,0 ) ));
				float temp_output_296_0 = ( 1.0 - _RimSize );
				float dotResult292 = dot( WorldNormal , WorldViewDirection );
				float clampResult513 = clamp( ( NdotL390 - ShadowSize277 ) , 0.0 , 1.0 );
				float smoothstepResult312 = smoothstep( temp_output_296_0 , ( temp_output_296_0 + _RimBlend ) , ( ( 1.0 - dotResult292 ) * pow( clampResult513 , 0.1 ) ));
				float2 temp_cast_28 = (_RimTextureTiling).xx;
				float2 texCoord291 = IN.ase_texcoord8.xy * temp_cast_28 + float2( 0,0 );
				float cos308 = cos( radians( _RimTextureRotation ) );
				float sin308 = sin( radians( _RimTextureRotation ) );
				float2 rotator308 = mul( (( _RimTextureViewProjection )?( ( ( _RimTextureTiling * 1 ) * mul( float4( WorldViewDirection , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( texCoord291 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos308 , -sin308 , sin308 , cos308 )) + float2( 0,0 );
				float4 Rim317 = (( _UseRim )?( ( ( saturate( smoothstepResult312 ) * Lighting276 ) * ( (( _RimLightColor )?( ( _RimLightIntensity * ase_lightColor ) ):( _RimColor )) * tex2D( _RimTexture, rotator308 ) ) ) ):( float4( 0,0,0,0 ) ));
				float2 uv_EmissiveMap = IN.ase_texcoord8.xy * _EmissiveMap_ST.xy + _EmissiveMap_ST.zw;
				float4 Emissiv453 = (( _UseEmissive )?( ( _EmissiveColor * tex2D( _EmissiveMap, uv_EmissiveMap ) ) ):( float4( 0,0,0,0 ) ));
				float3 WorldPosition609 = WorldPosition;
				float3 WorldNormal609 = WorldNormal;
				float3 localMyAddLight609 = MyAddLight609( WorldPosition609 , WorldNormal609 );
				float3 WorldPosition638 = WorldPosition;
				float3 WorldNormal638 = WorldNormal;
				float3 localMyAddLight2638 = MyAddLight2638( WorldPosition638 , WorldNormal638 );
				float3 AddLightColor520 = (( _Normalize )?( localMyAddLight2638 ):( localMyAddLight609 ));
				float4 Result195 = ( (( _UseRamp )?( ShadowRamp424 ):( ( ( ShadowColor157 * ( 1.0 - temp_output_124_0 ) ) + ( temp_output_124_0 * Color156 ) ) )) + Specular359 + Rim317 + Emissiv453 + float4( AddLightColor520 , 0.0 ) );
				
				float2 uv_Metal = IN.ase_texcoord8.xy * _Metal_ST.xy + _Metal_ST.zw;
				float4 tex2DNode456 = tex2D( _Metal, uv_Metal );
				float MetalicVar466 = (( _UseMetalSmooth )?( ( tex2DNode456.a * ( 1.0 - _Metalic ) ) ):( 1.0 ));
				
				float SmoothnessVar467 = (( _UseMetalSmooth )?( ( tex2DNode456.a * _Smoothness ) ):( 0.0 ));
				

				float3 BaseColor = color440.rgb;
				float3 Normal = NormalMap182;
				float3 Emission = Result195.rgb;
				float3 Specular = 0.5;
				float Metallic = MetalicVar466;
				float Smoothness = SmoothnessVar467;
				float Occlusion = 0.0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM
            #define _NORMAL_DROPOFF_TS 1
            #define ASE_FOG 1
            #define _EMISSION
            #define _NORMALMAP 1
            #define ASE_SRP_VERSION 120107

            #pragma multi_compile _ DOTS_INSTANCING_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _MainTexture_ST;
			float4 _ShadowColor;
			float4 _EmissiveColor;
			float4 _ColorA;
			float4 _DiffuseColor;
			float4 _ColorB;
			float4 _SpecularColor;
			float4 _Metal_ST;
			float4 _Texture0_ST;
			float4 _EmissiveMap_ST;
			float4 _RimColor;
			float _SpecularLightIntensity;
			float _RimLightColor;
			float _SpecularSize;
			float _SpecularBlend;
			float _UseRim;
			float _RimSize;
			float _RimBlend;
			float _UseNormalMap;
			float _RimTextureViewProjection;
			float _SpecLightColor;
			float _RimTextureTiling;
			float _RimTextureRotation;
			float _UseEmissive;
			float _Normalize;
			float _UseMetalSmooth;
			float _RimLightIntensity;
			float _SpecularTextureRotation;
			float _Level3;
			float _SpecularTextureViewProjection;
			float _NormalStrength;
			float _UseRamp;
			float _UseGradient;
			float _UseShadow;
			float _GradientPosition;
			float _GradientSize;
			float _ChangeAxis;
			float _GradientRotation;
			float _UseShadowTexture;
			float _SpecularTextureTiling;
			float _ShadowSize;
			float _ShadowTextureViewProjection;
			float _ShadowTextureTiling;
			float _Animate;
			float _XDirectionSpeed;
			float _YDirectionSpeed;
			float _ShadowTextureRotation;
			float _Level2;
			float _Metalic;
			float _UseSpecular;
			float _ShadowBlend;
			float _Smoothness;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "TA_TatoonEditor.TatoonEditorURP"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;19;-6748.139,-511.8786;Inherit;False;3141.077;1104.085;Comment;35;195;427;417;151;448;20;28;488;162;16;124;496;21;546;426;277;149;165;485;454;26;9;150;318;360;11;491;416;276;22;25;24;490;390;668;Lighting;1,0.9979696,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;278;-10342.36,-533.3039;Inherit;False;3098.866;1213.902;;41;511;283;512;513;290;285;286;281;280;282;315;297;313;279;317;291;287;288;294;303;316;293;300;284;302;296;310;298;306;312;314;309;299;311;292;307;308;304;305;575;576;Rim;0,0.9534545,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;668;-5696,144;Inherit;False;1060.696;389.6102;Comment;6;609;638;612;184;611;520;AddLights;1,0.9644862,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;361;-10087.7,-3735.146;Inherit;False;3146.392;855.5236;Albedo And Gradient;26;536;138;140;156;500;382;362;368;366;373;371;378;363;376;370;374;367;369;377;501;365;380;364;372;375;567;MainColor & Gradient;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;219;-11086.93,-2590.779;Inherit;False;7030.778;1753.407;Shadow;80;229;477;274;228;482;223;252;231;271;502;238;226;505;265;230;240;249;263;269;234;235;267;268;236;248;259;393;389;264;568;224;241;227;270;247;388;260;254;394;537;538;262;221;225;258;243;261;245;237;161;272;157;569;494;570;244;391;251;222;253;220;239;257;266;232;246;395;233;256;392;255;479;250;242;581;582;583;584;585;586;Shadow tex&color;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;425;-3992.389,-2575.573;Inherit;False;1469.388;534.6543;Comment;11;421;543;504;424;422;420;503;419;534;423;418;ShadowRamp;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;321;-10092.29,983.5153;Inherit;False;3301.643;968.2485;Specular;38;359;358;357;356;355;354;353;352;351;350;349;348;347;346;345;344;343;342;340;339;338;337;336;334;333;332;331;330;329;328;327;326;325;324;323;322;572;573;Specular;0,1,0.07320952,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;471;-2147.199,-2134.107;Inherit;False;829.4039;716.6099;Comment;7;73;458;469;187;440;468;196;Master;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;460;-4027.4,-1585.312;Inherit;False;1525.736;493.3411;Emissive;6;451;453;452;450;449;461;Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;470;-6839.955,-3686.134;Inherit;False;1474.649;795.6191;Comment;11;457;459;467;455;456;466;218;217;463;465;464;Metalic/Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;186;-6621.498,1165.718;Inherit;False;1621.35;791.9063;Comment;8;182;189;191;188;190;194;193;192;NormalMap;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;377;-8576.619,-3680.156;Inherit;False;Property;_DiffuseColor;Diffuse Color;2;0;Create;True;0;0;0;False;0;False;0.3279899,0.7075472,0.2903614,1;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;191;-6213.332,1220.696;Inherit;True;Property;_TextureSample1;Texture Sample 1;42;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;338;-8532.152,1406.399;Inherit;False;Property;_SpecularLightIntensity;Specular Light Intensity;41;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;240;-9790.87,-1818.357;Inherit;False;Property;_ShadowTextureViewProjection;Shadow Texture View Projection;15;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;190;-6505.327,1444.953;Inherit;True;Property;_Normal;Normal;12;0;Create;True;0;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;343;-8970.74,1751.994;Inherit;False;Property;_SpecularSize;Specular Size;42;0;Create;True;0;0;0;False;0;False;0.005;0.007;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;334;-9341.756,1175.232;Inherit;False;Property;_SpecularTextureViewProjection;Specular Texture View Projection;33;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;368;-9635.586,-3484.119;Inherit;False;Property;_ChangeAxis;ChangeAxis;44;0;Create;True;0;0;0;False;0;False;1;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;261;-7869.036,-2065.405;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;452;-3396.503,-1415.899;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;21;-6611.451,-443.096;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;249;-8401.936,-1710.243;Inherit;False;390;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;570;-4623.339,-1748.127;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;451;-3689.388,-1535.313;Inherit;False;Property;_EmissiveColor;EmissiveColor;54;1;[HDR];Create;True;0;0;0;False;0;False;4,4,4,0;2.996078,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;310;-8732.416,373.4601;Inherit;True;Property;_RimTex;RimTex;25;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;326;-9786.296,1415.062;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;188;-6184.77,1630.759;Inherit;True;Property;_Texture;Texture;4;2;[NoScaleOffset];[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;322;-10044.63,1558.836;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;568;-4473.875,-1911.882;Inherit;False;Property;_UseGradient;Use Gradient;16;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;395;-9925.384,-1491.689;Inherit;False;Property;_Animate;Animate;49;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;124;-5536.753,-160.8329;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;313;-8692.225,-385.6523;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;331;-9326.555,1425.534;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;317;-7503.033,-30.36684;Inherit;True;Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;221;-10916.96,-1262.859;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RadiansOpNode;235;-9302.64,-2061.807;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;267;-7027.837,-1782.518;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;339;-8890.547,1595.598;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;324;-10048.15,1178.442;Inherit;False;Property;_SpecularTextureTiling;Specular Texture Tiling;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;496;-4790.706,-57.94607;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;501;-7456.457,-3370.399;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;237;-9198.703,-1767.949;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;315;-7905.764,-0.176899;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;194;-6526.687,1219.257;Inherit;True;Property;_Texture0;Texture 0;11;2;[HideInInspector];[Normal];Create;False;0;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ToggleSwitchNode;274;-4792.679,-1897.071;Inherit;False;Property;_UseShadow;UseShadow;22;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;245;-8238.082,-1569.422;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;251;-8460.382,-1247.471;Inherit;False;390;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;582;-5311.188,-2103.62;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;329;-9305.279,1575.169;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;316;-7712.938,-29.89882;Inherit;False;Property;_UseRim;UseRim;14;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;426;-4305.81,-169.4902;Inherit;False;Property;_UseRamp;UseRamp;51;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleNode;284;-9693.787,290.7111;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;-7749.155,-3345.218;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;265;-7675.699,-1758.07;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;420;-3942.389,-2525.573;Inherit;True;Property;_ShadowRamp;ShadowRamp;50;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;546;-4287.484,198.6121;Inherit;False;520;AddLightColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;363;-9786.586,-3530.119;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;280;-10036.71,162.6442;Inherit;False;Property;_RimTextureTiling;Rim Texture Tiling;30;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;272;-5057.582,-1870.993;Inherit;False;Property;_UseShadowTexture;UseShadowTexture;39;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;255;-8708.683,-1847.268;Inherit;True;Property;_TextureSample2;Texture Sample 2;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;16;-6629.955,47.99187;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.NormalizeNode;346;-8682.613,1594.994;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;244;-10690,-1765.087;Inherit;True;Property;_ShadowTexture;Shadow Texture;13;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;298;-9126.58,-97.07584;Inherit;False;Property;_RimLightIntensity;Rim Light Intensity;37;0;Create;True;0;0;0;False;0;False;0.2588235;0.413;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;28;-5843.567,-231.0224;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;364;-9856.687,-3177.306;Inherit;False;Property;_GradientRotation;Gradient Rotation;25;0;Create;True;0;0;0;False;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;-6584.931,-3149.515;Inherit;True;Property;_Smoothness;Smoothness;23;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;234;-9349.436,-1435.62;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;375;-8816.933,-3272.666;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;151;-5936.754,97.9679;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;297;-9258.972,494.3002;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;459;-6150.807,-3367.923;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;308;-9026.793,434.1141;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;365;-9783.755,-3421.854;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;330;-9638.154,1180.933;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;427;-4581.952,7.725606;Inherit;False;424;ShadowRamp;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;392;-10538.72,-1130.564;Inherit;False;Property;_YDirectionSpeed;YDirectionSpeed;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;232;-8777.191,-1642.184;Inherit;False;277;ShadowSize;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;458;-1895.441,-1596.922;Inherit;False;Constant;_Float1;Float 1;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;356;-7848.317,1057.092;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;567;-8248.501,-3212.051;Inherit;False;Gradient;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;20;-6643.451,-299.0959;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;246;-8260.529,-1104.651;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;264;-7662.57,-2086.673;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldPosInputsNode;611;-5648,352;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;520;-4864,240;Inherit;False;AddLightColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;256;-8689.421,-2372.081;Inherit;True;Property;_tex1;tex1;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode;449;-3977.4,-1334.218;Inherit;True;Property;_EmissiveMap;EmissiveMap;52;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;575;-8314.849,-314.1323;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;389;-7334.046,-1549.698;Inherit;False;Property;_Level3;Level3;46;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;357;-7517.669,1066.905;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;226;-9642.782,-1439.073;Inherit;False;Constant;_Float2;Float 2;15;0;Create;True;0;0;0;False;0;False;45;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;469;-1957.488,-1684.654;Inherit;False;467;SmoothnessVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;250;-8923.314,-2218.538;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;340;-8836.324,1425.612;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;572;-8293.804,1496.261;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;534;-2967.049,-2374.762;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;225;-10561.45,-1427.977;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;247;-8969.112,-1431.342;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;291;-9699.059,142.9003;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;328;-9629.258,1313.536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RotatorNode;369;-9438.906,-3331.469;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NormalizeNode;332;-9070.937,1425.525;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;419;-3517.596,-2524.156;Inherit;True;Property;_TextureSample4;Texture Sample 4;61;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DotProductOpNode;353;-8430.15,1492.759;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-9483.269,490.1271;Inherit;False;Property;_RimTextureRotation;Rim Texture Rotation;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;354;-8057.359,1193.12;Inherit;False;Property;_SpecLightColor;Spec Light Color;40;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;352;-8467.606,1760.357;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;305;-8838.136,-55.53286;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;242;-8969.851,-1820.233;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;584;-5567.981,-1617.738;Inherit;False;156;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;380;-8047.03,-3351.144;Inherit;False;Property;_UseGradient;Use Gradient;17;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;373;-9197.09,-3324.125;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;376;-9083.063,-3509.429;Inherit;False;Property;_ColorB;Color B;17;0;Create;True;0;0;0;False;0;False;0,0.1264467,1,0;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;573;-8485.947,1606.082;Inherit;False;276;Lighting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;140;-8293.983,-3077.574;Inherit;True;Property;_MainTexture;MainTexture;0;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SmoothstepOpNode;257;-8111.063,-1232.259;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;138;-8065.533,-3074.086;Inherit;True;Property;_TextureSample0;Texture Sample 0;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;230;-9341.636,-1746.319;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;466;-5594.434,-3612.532;Inherit;False;MetalicVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;390;-6189.415,-446.3036;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;337;-8688.996,1228.841;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.NormalizeNode;336;-9072.461,1579.638;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;228;-10287.68,-1407.135;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;416;-5968.138,-439.4929;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;372;-8951.005,-3095.265;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;294;-9274.84,-30.01283;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;388;-7341.75,-1783.824;Inherit;False;Property;_Level2;Level2;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;536;-7727.408,-3074.943;Inherit;False;Texture;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;254;-8087.035,-1708.661;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;569;-4816.882,-1732.264;Inherit;False;567;Gradient;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;344;-8674.418,1760.802;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;347;-8670.809,1037.518;Inherit;True;Property;_SpecularMap;Specular Map;31;1;[NoScaleOffset];Create;True;0;0;0;False;1;;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;345;-8878.43,1849.314;Inherit;False;Property;_SpecularBlend;Specular Blend;43;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;349;-8259.263,1327.726;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;22;-6397.513,-385.4845;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;260;-8071.409,-2339.241;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;457;-6166.617,-3576.934;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;467;-5595.305,-3353.182;Inherit;False;SmoothnessVar;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;422;-3147.343,-2479.629;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;488;-5035.841,29.7647;Inherit;False;156;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;281;-10031.34,315.1791;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;463;-6298.017,-3436.053;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;576;-8492.849,-247.1323;Inherit;False;276;Lighting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;374;-9086.454,-3685.146;Inherit;False;Property;_ColorA;Color A;18;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;394;-10291.94,-1195.927;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleNode;227;-10439.65,-1547.12;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;252;-8096.844,-2058.568;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;453;-2917.064,-1428.475;Inherit;False;Emissiv;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-10441.18,-1919.467;Inherit;False;Property;_ShadowTextureTiling;Shadow Texture Tiling;19;0;Create;True;0;0;0;False;0;False;1;2.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;371;-9358.144,-3128.062;Inherit;False;Property;_GradientPosition;Gradient Position;24;0;Create;True;0;0;0;False;0;False;0;-0.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;262;-7849.367,-1676.293;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;-6589.402,-3382.718;Inherit;True;Property;_Metalic;Metalic;26;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;-4275.529,23.89081;Inherit;False;317;Rim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;241;-8448.966,-1618.868;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-6491.451,-33.09606;Inherit;False;Property;_ShadowBlend;ShadowBlend;6;0;Create;True;0;0;0;False;0;False;0.01;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;306;-8589.813,-167.7334;Float;False;Property;_RimColor;Rim Color;1;0;Create;True;0;0;0;False;0;False;0,1,0.8758622,0;0.4339623,0.4339623,0.4339623,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-7124.741,-3373.193;Inherit;False;Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;-7674.028,-1470.285;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;314;-8127.96,94.58018;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;287;-9485.851,370.9042;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;231;-10163.75,-1953.975;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;236;-8481.414,-1170.096;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.6;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;391;-10118.22,-1307.769;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;455;-6789.955,-3636.134;Inherit;True;Property;_Metal;Metal;53;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;26;-6171.45,-65.09598;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;350;-8680.015,1427.514;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;456;-6549.131,-3636.108;Inherit;True;Property;_TextureSample6;Texture Sample 6;64;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;25;-6498.956,-123.0923;Inherit;False;Property;_ShadowSize;Shadow Size;4;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;150;-6080.757,81.9679;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;-5285.822,-276.731;Inherit;False;Lighting;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;583;-5305.81,-1673.32;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;393;-10540.06,-1214.604;Inherit;False;Property;_XDirectionSpeed;XDirectionSpeed;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;223;-9647.054,-1705.536;Inherit;False;Constant;_Float0;Float 0;14;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;-1926.155,-1842.558;Inherit;False;195;Result;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;468;-1931.808,-1766.264;Inherit;False;466;MetalicVar;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;302;-9323.959,350.3221;Inherit;False;Property;_RimTextureViewProjection;Rim Texture View Projection;29;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;450;-3741.364,-1336.251;Inherit;True;Property;_TextureSample5;Texture Sample 5;63;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;259;-8246.425,-1847.058;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;454;-4275.03,107.8448;Inherit;False;453;Emissiv;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;355;-8155.546,1498.198;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;464;-5949.607,-3466.853;Inherit;False;Property;_UseMetalSmooth;UseMetalSmooth;56;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleNode;325;-9773.996,1313.536;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;279;-10028.46,488.9972;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;286;-9807.011,393.254;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;485;-5568.091,-303.0901;Inherit;False;ShadowMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;224;-9732.022,-1920.993;Inherit;False;Property;_ShadowTextureRotation;Shadow Texture Rotation;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;192;-6496.326,1663.225;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LightAttenuation;9;-6646.42,174.277;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;253;-8687.938,-1444.135;Inherit;True;Property;_TextureSample3;Texture Sample 3;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;263;-8253.411,-1445.944;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-9417.783,1343.552;Inherit;False;Property;_SpecularTextureRotation;Specular Texture Rotation;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;311;-8369.435,-33.39687;Inherit;True;Property;_RimLightColor;Rim Light Color;34;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;165;-4043.658,-164.1098;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;366;-9896.174,-3315.594;Inherit;False;Constant;_Vector0;Vector 0;45;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.PosVertexDataNode;362;-10050.8,-3524.073;Inherit;True;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RadiansOpNode;238;-9200.372,-1389.032;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;149;-6240.757,81.9679;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;351;-8334.592,1043.444;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;233;-8835.64,-1181.412;Inherit;False;277;ShadowSize;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;500;-7841.85,-3499.958;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;461;-3197.533,-1443.012;Inherit;False;Property;_UseEmissive;UseEmissive;55;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;358;-7311.77,1028.755;Inherit;False;Property;_UseSpecular;UseSpecular;28;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;342;-8942.756,1076.744;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;193;-6474.307,1824.307;Inherit;False;Property;_NormalStrength;Normal Strength;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;370;-9359.71,-3020.031;Inherit;False;Property;_GradientSize;Gradient Size;21;0;Create;True;0;0;0;False;0;False;0;0.89;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;268;-6804.387,-1782.094;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;243;-8251.977,-1967.31;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-6406.099,89.66991;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;-1934.617,-1920.459;Inherit;False;182;NormalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;348;-8334.121,1122.549;Inherit;False;Property;_SpecularColor;Specular Color;38;0;Create;True;0;0;0;False;0;False;0,1,0.8745098,0;1,0.9575656,0.75,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleSubtractOpNode;239;-8408.091,-2061.098;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;229;-8644.722,-2066.428;Inherit;False;277;ShadowSize;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;258;-7846.371,-1339.986;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;161;-5007.781,-2013.362;Inherit;False;156;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;304;-9047.945,201.6002;Inherit;True;Property;_RimTexture;Rim Texture;27;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;538;-5437.683,-1786.839;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;360;-4276.66,-55.0012;Inherit;False;359;Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;323;-10042.29,1386.789;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;502;-5653.709,-1769.655;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;359;-6980.354,1037.501;Inherit;True;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;333;-9119.453,1315.834;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;638;-5376,304;Inherit;False;float3 Color = 0@$#ifdef _ADDITIONAL_LIGHTS$int numLights = GetAdditionalLightsCount()@$for(int i = 0@ i<numLights@i++)${$    Light light = GetAdditionalLight(i, WorldPosition)@$    half3 AttLightColor = light.color *(step(0.0001, light.distanceAttenuation) * light.shadowAttenuation)@$$    half NdotL = step(0, dot(WorldNormal, light.direction))@$    half3 lighting = AttLightColor * NdotL@$$    Color += lighting @$    $}$#endif$return Color@;3;Create;2;True;WorldPosition;FLOAT3;0,0,0;In;;Float;False;True;WorldNormal;FLOAT3;0,0,0;In;;Float;False;MyAddLight2;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;465;-6015.213,-3615.399;Inherit;False;Property;_UseMetalSmooth;UseMetalSmooth;56;0;Create;False;0;0;0;False;0;False;0;True;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;378;-8541.84,-3325.241;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;222;-10901.03,-1440.162;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RadiansOpNode;367;-9639.562,-3173.516;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;494;-5488.878,-1968.925;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;440;-1962.443,-2095.107;Inherit;False;Constant;_Color0;Color 0;65;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WorldNormalVector;282;-10320,-480;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;285;-10320,-320;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;292;-10096,-400;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;309;-9120,-192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-9584,-80;Float;False;Property;_RimBlend;Rim Blend;3;0;Create;True;0;0;0;False;0;False;0;0.1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;-6176,-208;Inherit;False;ShadowSize;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;503;-3152,-2224;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;418;-3913.113,-2315.158;Inherit;False;417;N2;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;417;-5808,-448;Inherit;False;N2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;421;-3712,-2320;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;543;-3392,-2160;Inherit;False;485;ShadowMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;423;-3392,-2240;Inherit;False;156;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;504;-3398.139,-2312.923;Inherit;False;157;ShadowColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;424;-2767.329,-2467.733;Inherit;False;ShadowRamp;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;195;-3872,-176;Inherit;True;Result;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;189;-5536,1488;Inherit;False;Property;_UseNormalMap;UseNormalMap;5;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;182;-5312,1488;Inherit;False;NormalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;157;-4222.709,-1910.612;Inherit;True;ShadowColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;581;-5520,-2144;Inherit;False;156;Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;-8446.017,-2177.649;Inherit;False;390;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;269;-6619.651,-1775.534;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;505;-6384,-2000;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;479;-6208,-1856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;270;-6224,-2224;Inherit;False;Property;_ShadowColor;Shadow Color;10;0;Create;True;0;0;0;False;0;False;0.6603774,0.2087042,0.2087042,1;0.8018868,0.8018868,0.8018868,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;482;-6640,-2016;Inherit;True;276;Lighting;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;586;-5936,-2112;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;585;-5744,-2096;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;271;-6032,-1776;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;477;-5856,-1792;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;537;-5696.771,-1880.017;Inherit;False;536;Texture;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;448;-5184,-176;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;162;-5120,-368;Inherit;False;157;ShadowColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;490;-4896,-336;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;491;-4608,-240;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;283;-10304.81,-158.7738;Inherit;False;390;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;300;-9968,-400;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;307;-9648,-320;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;511;-10128,-128;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;513;-9968,-128;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;303;-9824,-80;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-9984,32;Inherit;False;Constant;_Float4;Float 4;44;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;288;-9584,-160;Float;False;Property;_RimSize;Rim Size;9;0;Create;True;0;0;0;False;0;False;0.2881133;0.47;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;296;-9296,-256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;312;-8976,-368;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;512;-10309.34,-58.69006;Inherit;False;277;ShadowSize;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;612;-5648,208;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ToggleSwitchNode;184;-5088,240;Inherit;False;Property;_Normalize;Normalize;8;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;609;-5376,208;Inherit;False;float3 Color = 0@$#ifdef _ADDITIONAL_LIGHTS$int numLights = GetAdditionalLightsCount()@$for(int i = 0@ i<numLights@i++)${$	Light light = GetAdditionalLight(i, WorldPosition)@$	half3 AttLightColor = light.color *(light.distanceAttenuation * light.shadowAttenuation)@$	Color +=LightingLambert(AttLightColor, light.direction, WorldNormal)@$	$}$#endif$return Color@;3;Create;2;True;WorldPosition;FLOAT3;0,0,0;In;;Float;False;True;WorldNormal;FLOAT3;0,0,0;In;;Float;False;MyAddLight;True;False;0;;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;75;47.59428,-301.4305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;76;47.59428,-301.4305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;72;-2821.253,1324.802;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;OutlinePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;True;True;0;4;False;;1;False;;0;2;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;True;1;False;;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;False;255;False;;255;False;;255;False;;8;False;;3;False;;3;False;;3;False;;7;False;;1;False;;1;False;;1;False;;True;True;2;True;;True;0;False;;True;False;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;508;-1599.224,-1808.953;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;0;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;73;-1599.224,-1868.953;Float;False;True;-1;2;TA_TatoonEditor.TatoonEditorURP;0;12;TetraArts/Tatoon2/URP/Tatoon2_URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;0;False;;True;0;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;0;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;42;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;637873397267127940;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;638047072735636116;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;False;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;77;47.59428,-301.4305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;507;-1599.224,-1808.953;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;74;47.59428,-301.4305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;669;-1599.224,-1788.953;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;670;-1599.224,-1788.953;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;191;0;194;0
WireConnection;240;0;231;0
WireConnection;240;1;395;0
WireConnection;334;0;330;0
WireConnection;334;1;328;0
WireConnection;368;0;363;0
WireConnection;368;1;365;0
WireConnection;261;0;252;0
WireConnection;452;0;451;0
WireConnection;452;1;450;0
WireConnection;570;0;274;0
WireConnection;570;1;569;0
WireConnection;310;0;304;0
WireConnection;310;1;308;0
WireConnection;326;0;323;0
WireConnection;326;1;322;0
WireConnection;188;0;190;0
WireConnection;188;1;192;0
WireConnection;188;5;193;0
WireConnection;568;0;274;0
WireConnection;568;1;570;0
WireConnection;395;0;228;0
WireConnection;395;1;391;0
WireConnection;124;0;28;0
WireConnection;124;1;151;0
WireConnection;313;0;312;0
WireConnection;317;0;316;0
WireConnection;235;0;224;0
WireConnection;267;0;264;0
WireConnection;267;1;388;0
WireConnection;267;2;389;0
WireConnection;496;0;124;0
WireConnection;496;1;488;0
WireConnection;501;0;500;1
WireConnection;501;1;382;0
WireConnection;237;0;230;0
WireConnection;315;0;575;0
WireConnection;315;1;314;0
WireConnection;274;0;161;0
WireConnection;274;1;272;0
WireConnection;245;0;241;0
WireConnection;582;0;581;0
WireConnection;582;1;494;0
WireConnection;316;1;315;0
WireConnection;426;0;491;0
WireConnection;426;1;427;0
WireConnection;284;0;280;0
WireConnection;382;0;380;0
WireConnection;382;1;138;0
WireConnection;265;0;259;0
WireConnection;265;1;262;0
WireConnection;363;0;362;1
WireConnection;363;1;362;2
WireConnection;272;0;582;0
WireConnection;272;1;583;0
WireConnection;255;0;244;0
WireConnection;255;1;242;0
WireConnection;346;0;339;0
WireConnection;28;0;22;0
WireConnection;28;1;25;0
WireConnection;28;2;26;0
WireConnection;234;0;224;0
WireConnection;234;1;226;0
WireConnection;375;0;373;0
WireConnection;375;1;371;0
WireConnection;375;2;372;0
WireConnection;151;0;150;0
WireConnection;151;1;149;2
WireConnection;297;0;293;0
WireConnection;459;0;456;4
WireConnection;459;1;217;0
WireConnection;308;0;302;0
WireConnection;308;2;297;0
WireConnection;365;0;362;2
WireConnection;365;1;362;3
WireConnection;330;0;324;0
WireConnection;356;0;351;0
WireConnection;356;1;354;0
WireConnection;567;0;378;0
WireConnection;246;0;236;0
WireConnection;264;0;260;0
WireConnection;264;1;261;0
WireConnection;520;0;184;0
WireConnection;256;0;244;0
WireConnection;256;1;250;0
WireConnection;575;0;313;0
WireConnection;575;1;576;0
WireConnection;389;1;266;0
WireConnection;357;0;356;0
WireConnection;357;1;355;0
WireConnection;250;0;240;0
WireConnection;250;2;235;0
WireConnection;340;0;332;0
WireConnection;340;1;336;0
WireConnection;572;0;353;0
WireConnection;572;1;573;0
WireConnection;534;0;422;0
WireConnection;534;1;503;0
WireConnection;225;0;222;0
WireConnection;225;1;221;0
WireConnection;247;0;240;0
WireConnection;247;2;238;0
WireConnection;291;0;280;0
WireConnection;328;0;325;0
WireConnection;328;1;326;0
WireConnection;369;0;368;0
WireConnection;369;1;366;0
WireConnection;369;2;367;0
WireConnection;332;0;331;0
WireConnection;419;0;420;0
WireConnection;419;1;421;0
WireConnection;353;0;350;0
WireConnection;353;1;346;0
WireConnection;354;0;348;0
WireConnection;354;1;349;0
WireConnection;352;0;344;0
WireConnection;352;1;345;0
WireConnection;305;0;298;0
WireConnection;305;1;294;0
WireConnection;242;0;240;0
WireConnection;242;2;237;0
WireConnection;380;0;377;0
WireConnection;380;1;378;0
WireConnection;373;0;369;0
WireConnection;257;0;251;0
WireConnection;257;1;236;0
WireConnection;257;2;246;0
WireConnection;138;0;140;0
WireConnection;230;0;224;0
WireConnection;230;1;223;0
WireConnection;466;0;465;0
WireConnection;390;0;22;0
WireConnection;336;0;329;0
WireConnection;228;0;227;0
WireConnection;228;1;225;0
WireConnection;416;0;390;0
WireConnection;372;0;371;0
WireConnection;372;1;370;0
WireConnection;388;1;265;0
WireConnection;536;0;138;0
WireConnection;254;0;249;0
WireConnection;254;1;241;0
WireConnection;254;2;245;0
WireConnection;344;0;343;0
WireConnection;347;1;342;0
WireConnection;349;0;337;0
WireConnection;349;1;338;0
WireConnection;22;0;21;0
WireConnection;22;1;20;0
WireConnection;260;0;256;0
WireConnection;457;0;456;4
WireConnection;457;1;463;0
WireConnection;467;0;464;0
WireConnection;422;0;419;0
WireConnection;422;1;504;0
WireConnection;463;0;218;0
WireConnection;394;0;393;0
WireConnection;394;1;392;0
WireConnection;227;0;220;0
WireConnection;252;0;248;0
WireConnection;252;1;239;0
WireConnection;252;2;243;0
WireConnection;453;0;461;0
WireConnection;262;0;254;0
WireConnection;241;0;232;0
WireConnection;156;0;501;0
WireConnection;266;0;263;0
WireConnection;266;1;258;0
WireConnection;314;0;311;0
WireConnection;314;1;310;0
WireConnection;287;0;284;0
WireConnection;287;1;286;0
WireConnection;231;0;220;0
WireConnection;236;0;233;0
WireConnection;391;0;228;0
WireConnection;391;2;394;0
WireConnection;26;0;25;0
WireConnection;26;1;24;0
WireConnection;350;0;340;0
WireConnection;456;0;455;0
WireConnection;150;0;149;0
WireConnection;150;1;149;1
WireConnection;276;0;124;0
WireConnection;583;0;538;0
WireConnection;583;1;584;0
WireConnection;302;0;291;0
WireConnection;302;1;287;0
WireConnection;450;0;449;0
WireConnection;259;0;255;0
WireConnection;355;0;572;0
WireConnection;355;1;344;0
WireConnection;355;2;352;0
WireConnection;464;1;459;0
WireConnection;325;0;324;0
WireConnection;286;0;281;0
WireConnection;286;1;279;0
WireConnection;485;0;28;0
WireConnection;253;0;244;0
WireConnection;253;1;247;0
WireConnection;263;0;253;0
WireConnection;311;0;306;0
WireConnection;311;1;305;0
WireConnection;165;0;426;0
WireConnection;165;1;360;0
WireConnection;165;2;318;0
WireConnection;165;3;454;0
WireConnection;165;4;546;0
WireConnection;238;0;234;0
WireConnection;149;0;11;0
WireConnection;351;0;347;0
WireConnection;461;1;452;0
WireConnection;358;1;357;0
WireConnection;342;0;334;0
WireConnection;342;2;333;0
WireConnection;268;0;267;0
WireConnection;243;0;239;0
WireConnection;11;0;16;1
WireConnection;11;1;9;0
WireConnection;239;0;229;0
WireConnection;258;0;257;0
WireConnection;538;0;537;0
WireConnection;538;1;502;0
WireConnection;502;0;477;0
WireConnection;502;1;505;0
WireConnection;359;0;358;0
WireConnection;333;0;327;0
WireConnection;638;0;611;0
WireConnection;638;1;612;0
WireConnection;465;1;457;0
WireConnection;378;0;374;0
WireConnection;378;1;376;0
WireConnection;378;2;375;0
WireConnection;367;0;364;0
WireConnection;494;0;585;0
WireConnection;494;1;537;0
WireConnection;292;0;282;0
WireConnection;292;1;285;0
WireConnection;309;0;296;0
WireConnection;309;1;299;0
WireConnection;277;0;25;0
WireConnection;503;0;423;0
WireConnection;503;1;543;0
WireConnection;417;0;416;0
WireConnection;421;0;418;0
WireConnection;424;0;534;0
WireConnection;195;0;165;0
WireConnection;189;0;191;0
WireConnection;189;1;188;0
WireConnection;182;0;189;0
WireConnection;157;0;568;0
WireConnection;269;0;268;0
WireConnection;269;1;252;0
WireConnection;505;0;482;0
WireConnection;479;0;505;0
WireConnection;586;0;270;0
WireConnection;586;1;479;0
WireConnection;585;0;586;0
WireConnection;585;1;505;0
WireConnection;271;0;479;0
WireConnection;271;1;269;0
WireConnection;477;0;270;0
WireConnection;477;1;271;0
WireConnection;448;0;124;0
WireConnection;490;0;162;0
WireConnection;490;1;448;0
WireConnection;491;0;490;0
WireConnection;491;1;496;0
WireConnection;300;0;292;0
WireConnection;307;0;300;0
WireConnection;307;1;303;0
WireConnection;511;0;283;0
WireConnection;511;1;512;0
WireConnection;513;0;511;0
WireConnection;303;0;513;0
WireConnection;303;1;290;0
WireConnection;296;0;288;0
WireConnection;312;0;307;0
WireConnection;312;1;296;0
WireConnection;312;2;309;0
WireConnection;184;0;609;0
WireConnection;184;1;638;0
WireConnection;609;0;611;0
WireConnection;609;1;612;0
WireConnection;73;0;440;0
WireConnection;73;1;187;0
WireConnection;73;2;196;0
WireConnection;73;3;468;0
WireConnection;73;4;469;0
WireConnection;73;5;458;0
ASEEND*/
//CHKSM=77F37F9738CC3BE575EF35FB2A26BC27005FC8EB