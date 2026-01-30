// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TetraArts/Tatoon2/Built-in/Tatoon2_Built-in_Outlined"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_ShadowSize("ShadowSize", Range( 0 , 2)) = 0
		_ShadowBlend("ShadowBlend", Range( 0 , 1)) = 0.5391
		_DiffuseColor("Diffuse Color", Color) = (1,0.75,0.75,0)
		[Toggle]_UseRim("UseRim", Float) = 1
		_RimColor("Rim Color", Color) = (0,1,0.8758622,0)
		_MainTexture("MainTexture", 2D) = "white" {}
		[NoScaleOffset]_RimTexture("Rim Texture", 2D) = "white" {}
		[Toggle]_RimTextureViewProjection("Rim Texture View Projection", Float) = 0
		_RimTextureTiling("Rim Texture Tiling", Float) = 0
		_ShadowColor("Shadow Color", Color) = (1,0,0,1)
		_RimTextureRotation("Rim Texture Rotation", Float) = 0
		[Toggle]_RimLightColor("Rim Light Color", Float) = 0
		_RimLightIntensity("Rim Light Intensity", Range( 0 , 10)) = 0
		[NoScaleOffset]_ShadowTexture("Shadow Texture", 2D) = "white" {}
		_RimSize("Rim Size", Range( -1 , 2)) = 0.4104842
		_RimBlend("Rim Blend", Range( 0.1 , 10)) = 0.1
		[Toggle]_ShadowTextureViewProjection("Shadow Texture View Projection", Float) = 0
		[Toggle]_UseSpecular("UseSpecular", Float) = 1
		_ShadowTextureTiling("Shadow Texture Tiling", Float) = 0
		[Toggle]_UseGradient("Use Gradient", Float) = 0
		[NoScaleOffset]_SpecularMap("Specular Map", 2D) = "gray" {}
		_ShadowTextureRotation("Shadow Texture Rotation", Float) = 0
		[Toggle]_SpecularTextureViewProjection("Specular Texture View Projection", Float) = 0
		_ColorB("Color B", Color) = (0,0.1264467,1,0)
		_ColorA("Color A", Color) = (1,0,0,0)
		[Toggle]_UseShadow("UseShadow", Float) = 0
		_SpecularTextureTiling("Specular Texture Tiling", Float) = 0
		_SpecularTextureRotation("Specular Texture Rotation", Float) = 0
		_GradientSize("Gradient Size", Range( 0 , 10)) = 0
		_SpecularColor("Specular Color", Color) = (1,0.9575656,0.75,0)
		[Toggle]_UseOutline("UseOutline", Float) = 0
		[Toggle]_SpecLightColor("Spec Light Color", Float) = 0
		_GradientPosition("Gradient Position", Float) = 0
		_SpecularLightIntensity("Specular Light Intensity", Range( 0 , 10)) = 1
		_GradientRotation("Gradient Rotation", Float) = 0
		_SpecularSize("Specular Size", Range( 0 , 1)) = 0.005
		[Toggle]_OutlineNoise("OutlineNoise", Float) = 0
		_SpecularBlend("Specular Blend", Range( 0 , 1)) = 0
		[HDR]_OutlineColor("Outline Color", Color) = (0,0.07410216,1,0)
		_OutlineSize("Outline Size", Float) = 0.1
		_OutlineNoiseScale("OutlineNoiseScale", Float) = 1
		[Toggle]_Level2("Level2", Float) = 0
		[Toggle]_Level3("Level3", Float) = 0
		[Toggle]_Animate("Animate", Float) = 0
		[Toggle]_UseShadowTexture("UseShadowTexture", Float) = 0
		_XDirectionSpeed("XDirectionSpeed", Float) = 0
		_YDirectionSpeed("YDirectionSpeed", Float) = 0
		[Toggle]_ChangeAxis("ChangeAxis", Float) = 0
		_XSpeed("XSpeed", Float) = 0
		_YSpeed("YSpeed", Float) = 0
		_EmissiveMap("EmissiveMap", 2D) = "white" {}
		[Toggle]_UseEmissive("UseEmissive", Float) = 0
		[HDR]_EmissiveColor("EmissiveColor", Color) = (2.996078,0.0611825,0,0)
		_TextureRamp("TextureRamp", 2D) = "white" {}
		[Toggle]_UseRamp("UseRamp", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0"}
		ZWrite On
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult445 = (float2(_XSpeed , _YSpeed));
			float2 panner444 = ( 1.0 * _Time.y * appendResult445 + v.texcoord.xy);
			float simplePerlin2D228 = snoise( panner444*(( _OutlineNoise )?( _OutlineNoiseScale ):( 0.0 )) );
			simplePerlin2D228 = simplePerlin2D228*0.5 + 0.5;
			float outlineVar = (( _UseOutline )?( (( _OutlineNoise )?( ( _OutlineSize * simplePerlin2D228 ) ):( (( _UseOutline )?( _OutlineSize ):( 0.0 )) )) ):( 0.0 ));
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			float2 uv_MainTexture = i.uv_texcoord * _MainTexture_ST.xy + _MainTexture_ST.zw;
			float4 tex2DNode304 = tex2D( _MainTexture, uv_MainTexture );
			float Alpha305 = tex2DNode304.a;
			o.Emission = (( _UseOutline )?( _OutlineColor ):( float4( 0,0,0,0 ) )).rgb;
			clip( (( _UseOutline )?( Alpha305 ):( 0.0 )) - _Cutoff );
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite On
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			float3 viewDir;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _UseOutline;
		uniform float _UseEmissive;
		uniform float4 _EmissiveColor;
		uniform sampler2D _EmissiveMap;
		uniform float4 _EmissiveMap_ST;
		uniform float _UseRamp;
		uniform float _UseShadow;
		uniform float _UseShadowTexture;
		uniform float4 _ShadowColor;
		uniform sampler2D _ShadowTexture;
		uniform float _ShadowTextureViewProjection;
		uniform float _ShadowTextureTiling;
		uniform float _Animate;
		uniform float _XDirectionSpeed;
		uniform float _YDirectionSpeed;
		uniform float _ShadowTextureRotation;
		uniform float _Level2;
		uniform float _Level3;
		uniform sampler2D _TextureRamp;
		uniform float _UseGradient;
		uniform float4 _DiffuseColor;
		uniform float4 _ColorA;
		uniform float4 _ColorB;
		uniform float _GradientPosition;
		uniform float _GradientSize;
		uniform float _ChangeAxis;
		uniform float _GradientRotation;
		uniform sampler2D _MainTexture;
		uniform float4 _MainTexture_ST;
		uniform float _ShadowSize;
		uniform float _ShadowBlend;
		uniform float _UseSpecular;
		uniform sampler2D _SpecularMap;
		uniform float _SpecularTextureViewProjection;
		uniform float _SpecularTextureTiling;
		uniform float _SpecularTextureRotation;
		uniform float _SpecLightColor;
		uniform float4 _SpecularColor;
		uniform float _SpecularLightIntensity;
		uniform float _SpecularSize;
		uniform float _SpecularBlend;
		uniform float _UseRim;
		uniform float _RimSize;
		uniform float _RimBlend;
		uniform float _RimLightColor;
		uniform float4 _RimColor;
		uniform float _RimLightIntensity;
		uniform sampler2D _RimTexture;
		uniform float _RimTextureViewProjection;
		uniform float _RimTextureTiling;
		uniform float _RimTextureRotation;
		uniform float4 _OutlineColor;
		uniform float _Cutoff = 0.5;
		uniform float _OutlineNoise;
		uniform float _OutlineSize;
		uniform float _XSpeed;
		uniform float _YSpeed;
		uniform float _OutlineNoiseScale;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 Outline242 = (( _UseOutline )?( 0 ):( float3( 0,0,0 ) ));
			v.vertex.xyz += Outline242;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			float4 color218 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float2 temp_cast_4 = (_ShadowTextureTiling).xx;
			float2 uv_TexCoord209 = i.uv_texcoord * temp_cast_4;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 temp_output_210_0 = ( ( _ShadowTextureTiling * 1 ) * mul( UNITY_MATRIX_VP, float4( ase_worldViewDir , 0.0 ) ).xyz );
			float2 appendResult423 = (float2(_XDirectionSpeed , _YDirectionSpeed));
			float2 panner403 = ( 1.0 * _Time.y * appendResult423 + temp_output_210_0.xy);
			float cos356 = cos( radians( _ShadowTextureRotation ) );
			float sin356 = sin( radians( _ShadowTextureRotation ) );
			float2 rotator356 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner403 ,  0.0 ) ):( temp_output_210_0 )) ):( float3( uv_TexCoord209 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos356 , -sin356 , sin356 , cos356 )) + float2( 0,0 );
			float3 ase_worldNormal = i.worldNormal;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float dotResult3 = dot( ase_worldNormal , ase_worldlightDir );
			float N398 = dotResult3;
			float smoothstepResult380 = smoothstep( -0.5 , 0.05 , N398);
			float cos214 = cos( radians( ( _ShadowTextureRotation + 90.0 ) ) );
			float sin214 = sin( radians( ( _ShadowTextureRotation + 90.0 ) ) );
			float2 rotator214 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner403 ,  0.0 ) ):( temp_output_210_0 )) ):( float3( uv_TexCoord209 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos214 , -sin214 , sin214 , cos214 )) + float2( 0,0 );
			float smoothstepResult399 = smoothstep( -0.5 , 0.5 , N398);
			float cos360 = cos( radians( ( _ShadowTextureRotation + 45.0 ) ) );
			float sin360 = sin( radians( ( _ShadowTextureRotation + 45.0 ) ) );
			float2 rotator360 = mul( (( _ShadowTextureViewProjection )?( (( _Animate )?( float3( panner403 ,  0.0 ) ):( temp_output_210_0 )) ):( float3( uv_TexCoord209 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos360 , -sin360 , sin360 , cos360 )) + float2( 0,0 );
			float smoothstepResult386 = smoothstep( -0.5 , 1.0 , N398);
			float2 temp_cast_25 = ((N398*0.5 + 0.5)).xx;
			float4 ShadowRamp470 = tex2D( _TextureRamp, temp_cast_25 );
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float2 appendResult290 = (float2(ase_vertex3Pos.x , ase_vertex3Pos.y));
			float2 appendResult424 = (float2(ase_vertex3Pos.y , ase_vertex3Pos.z));
			float cos292 = cos( radians( _GradientRotation ) );
			float sin292 = sin( radians( _GradientRotation ) );
			float2 rotator292 = mul( (( _ChangeAxis )?( appendResult424 ):( appendResult290 )) - float2( 0,0 ) , float2x2( cos292 , -sin292 , sin292 , cos292 )) + float2( 0,0 );
			float smoothstepResult297 = smoothstep( _GradientPosition , ( _GradientPosition + _GradientSize ) , rotator292.x);
			float4 lerpResult301 = lerp( _ColorA , _ColorB , smoothstepResult297);
			float2 uv_MainTexture = i.uv_texcoord * _MainTexture_ST.xy + _MainTexture_ST.zw;
			float4 tex2DNode304 = tex2D( _MainTexture, uv_MainTexture );
			float4 MainColor307 = ( (( _UseGradient )?( lerpResult301 ):( _DiffuseColor )) * tex2DNode304 );
			float4 Shadow81 = ( (( _UseRamp )?( ( (( _UseShadow )?( (( _UseShadowTexture )?( ( _ShadowColor * ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator356 ) ) * ( 1.0 - smoothstepResult380 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator214 ) ) * ( 1.0 - smoothstepResult399 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator360 ) ) * ( 1.0 - smoothstepResult386 ) ) ):( float4( 0,0,0,0 ) )) ) ) ) ):( ( float4( ase_lightColor.rgb , 0.0 ) * _ShadowColor ) )) ):( ( color218 * float4( ase_lightColor.rgb , 0.0 ) ) )) * ShadowRamp470 ) ):( (( _UseShadow )?( (( _UseShadowTexture )?( ( _ShadowColor * ( 1.0 - ( ( ( 1.0 - tex2D( _ShadowTexture, rotator356 ) ) * ( 1.0 - smoothstepResult380 ) ) + (( _Level2 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator214 ) ) * ( 1.0 - smoothstepResult399 ) ) ):( float4( 0,0,0,0 ) )) + (( _Level3 )?( ( ( 1.0 - tex2D( _ShadowTexture, rotator360 ) ) * ( 1.0 - smoothstepResult386 ) ) ):( float4( 0,0,0,0 ) )) ) ) ) ):( ( float4( ase_lightColor.rgb , 0.0 ) * _ShadowColor ) )) ):( ( color218 * float4( ase_lightColor.rgb , 0.0 ) ) )) )) * MainColor307 );
			float smoothstepResult10 = smoothstep( _ShadowSize , ( _ShadowSize + _ShadowBlend ) , dotResult3);
			float3 temp_output_494_0 = ( ase_lightColor.rgb * pow( ase_lightAtten , 0.35 ) );
			float3 break63 = temp_output_494_0;
			float temp_output_61_0 = max( max( break63.x , break63.y ) , break63.z );
			float temp_output_73_0 = ( smoothstepResult10 * temp_output_61_0 );
			float3 temp_cast_26 = (( 1.0 - temp_output_73_0 )).xxx;
			float3 temp_output_64_0 = ( smoothstepResult10 * temp_output_494_0 );
			#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch76 = temp_output_64_0;
			#else
				float3 staticSwitch76 = temp_cast_26;
			#endif
			float3 LightingInfos77 = staticSwitch76;
			float4 lerpResult46 = lerp( float4( 0,0,0,0 ) , Shadow81 , float4( LightingInfos77 , 0.0 ));
			#ifdef UNITY_PASS_FORWARDADD
				float3 staticSwitch58 = temp_output_64_0;
			#else
				float3 staticSwitch58 = ( temp_output_64_0 * temp_output_61_0 );
			#endif
			float3 Lighting78 = staticSwitch58;
			float4 lerpResult67 = lerp( float4( 0,0,0,0 ) , MainColor307 , float4( Lighting78 , 0.0 ));
			float2 temp_cast_29 = (_SpecularTextureTiling).xx;
			float2 uv_TexCoord164 = i.uv_texcoord * temp_cast_29;
			float cos199 = cos( radians( _SpecularTextureRotation ) );
			float sin199 = sin( radians( _SpecularTextureRotation ) );
			float2 rotator199 = mul( (( _SpecularTextureViewProjection )?( ( ( _SpecularTextureTiling * 1 ) * mul( float4( i.viewDir , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( uv_TexCoord164 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos199 , -sin199 , sin199 , cos199 )) + float2( 0,0 );
			float temp_output_168_0 = ( 1.0 - _SpecularSize );
			float3 normalizeResult167 = normalize( ase_worldlightDir );
			float3 normalizeResult200 = normalize( i.viewDir );
			float3 normalizeResult165 = normalize( ( normalizeResult167 + normalizeResult200 ) );
			float3 normalizeResult190 = normalize( ase_worldNormal );
			float dotResult179 = dot( normalizeResult165 , normalizeResult190 );
			float smoothstepResult194 = smoothstep( temp_output_168_0 , ( temp_output_168_0 + _SpecularBlend ) , dotResult179);
			float NdotL122 = temp_output_73_0;
			float4 Specular193 = (( _UseSpecular )?( ( ( ( ( 1.0 - tex2D( _SpecularMap, rotator199 ) ) * (( _SpecLightColor )?( ( ase_lightColor * _SpecularLightIntensity ) ):( _SpecularColor )) ) * smoothstepResult194 ) * NdotL122 ) ):( float4( 0,0,0,0 ) ));
			float temp_output_125_0 = ( 1.0 - _RimSize );
			float dotResult116 = dot( ase_worldNormal , ase_worldViewDir );
			float ShadowSize513 = _ShadowSize;
			float clampResult515 = clamp( ( N398 - ShadowSize513 ) , 0.0 , 1.0 );
			float smoothstepResult517 = smoothstep( temp_output_125_0 , ( temp_output_125_0 + _RimBlend ) , ( ( 1.0 - dotResult116 ) * pow( clampResult515 , 0.19 ) ));
			float2 temp_cast_35 = (_RimTextureTiling).xx;
			float2 uv_TexCoord99 = i.uv_texcoord * temp_cast_35;
			float cos112 = cos( radians( _RimTextureRotation ) );
			float sin112 = sin( radians( _RimTextureRotation ) );
			float2 rotator112 = mul( (( _RimTextureViewProjection )?( ( ( _RimTextureTiling * 1 ) * mul( float4( ase_worldViewDir , 0.0 ), UNITY_MATRIX_VP ).xyz ) ):( float3( uv_TexCoord99 ,  0.0 ) )).xy - float2( 0,0 ) , float2x2( cos112 , -sin112 , sin112 , cos112 )) + float2( 0,0 );
			float4 Rim121 = (( _UseRim )?( ( saturate( smoothstepResult517 ) * ( (( _RimLightColor )?( float4( ( _RimLightIntensity * ase_lightColor.rgb ) , 0.0 ) ):( _RimColor )) * tex2D( _RimTexture, rotator112 ) ) ) ):( float4( 0,0,0,0 ) ));
			float4 Result329 = ( lerpResult46 + lerpResult67 + Specular193 + Rim121 );
			c.rgb = Result329.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float4 color499 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			o.Albedo = color499.rgb;
			float2 uv_EmissiveMap = i.uv_texcoord * _EmissiveMap_ST.xy + _EmissiveMap_ST.zw;
			float4 Emissive461 = (( _UseEmissive )?( ( _EmissiveColor * (tex2D( _EmissiveMap, uv_EmissiveMap )).rgba ) ):( float4( 0,0,0,0 ) ));
			o.Emission = Emissive461.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = worldViewDir;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "TatoonEditor_OutlineIncluded"
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.CommentaryNode;203;-3950.144,-1362.448;Inherit;False;5293.898;959.9914;Shadow;62;81;18;86;220;407;418;219;218;392;408;216;406;376;382;415;410;384;400;381;367;402;366;385;401;355;380;399;359;386;356;377;217;357;214;360;369;215;387;213;361;212;209;363;362;416;364;211;403;365;210;423;422;207;421;208;204;206;205;497;472;471;519;Shadow tex&color;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-3672.033,-1047.808;Inherit;False;Property;_ShadowTextureTiling;Shadow Texture Tiling;19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;204;-3699.713,-828.3357;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;205;-3673.052,-717.382;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;208;-3467.541,-764.744;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleNode;207;-3448.425,-939.5887;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;421;-3507.307,-622.8287;Inherit;False;Property;_XDirectionSpeed;XDirectionSpeed;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;422;-3506.05,-543.3158;Inherit;False;Property;_YDirectionSpeed;YDirectionSpeed;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;57;-1744,-176;Inherit;False;2700.444;915.5321;Comment;25;78;58;71;77;76;75;64;122;73;61;10;62;13;11;12;63;7;398;3;1;2;494;493;513;518;Lighting;0.9427508,1,0,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-3298.697,-888.0674;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;423;-3281.125,-618.2382;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;211;-2952.789,-723.2004;Inherit;False;Property;_ShadowTextureRotation;Shadow Texture Rotation;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;364;-2889.193,-617.9921;Inherit;False;Constant;_Float3;Float 3;58;0;Create;True;0;0;0;False;0;False;90;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;403;-3137.31,-812.5699;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;365;-2886.193,-541.9921;Inherit;False;Constant;_Float4;Float 4;58;0;Create;True;0;0;0;False;0;False;45;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;1;-1712,-128;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;2;-1712,32;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;363;-2702.193,-568.9921;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;362;-2663.193,-731.9921;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;209;-3420.447,-1085.819;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;416;-2961.819,-893.2912;Inherit;False;Property;_Animate;Animate;44;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;3;-1440,-80;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;398;-1040,-128;Inherit;False;N;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;213;-2778.431,-995.1993;Inherit;False;Property;_ShadowTextureViewProjection;Shadow Texture View Projection;17;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RadiansOpNode;212;-2529.075,-805.3345;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;361;-2553.521,-623.1453;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;286;-3952,-2400;Inherit;False;3225.823;877.6078;Albedo And Gradient;23;425;424;290;289;288;305;306;304;303;300;302;301;298;299;297;295;296;293;292;294;291;287;307;MainColor & Gradient;1,0,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;369;-1742.69,-907.7612;Inherit;False;398;N;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;357;-2529.671,-1138.625;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;360;-2407.885,-724.4999;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;215;-3209.746,-1280.507;Inherit;True;Property;_ShadowTexture;Shadow Texture;14;1;[NoScaleOffset];Create;True;0;0;0;True;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RotatorNode;214;-2423.439,-967.4888;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;387;-1733.526,-650.6461;Inherit;False;398;N;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;287;-3760,-2208;Inherit;True;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;217;-2206.277,-998.7722;Inherit;True;Property;_tex1;tex1;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;377;-1825.591,-1173.068;Inherit;False;398;N;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;399;-1499.382,-901.3561;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;356;-2374.434,-1223.98;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;359;-2208.617,-749.0729;Inherit;True;Property;_TextureSample3;Texture Sample 3;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SmoothstepOpNode;386;-1505.278,-659.1597;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;290;-3504,-2240;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;424;-3488,-2128;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;288;-3584,-1744;Inherit;False;Property;_GradientRotation;Gradient Rotation;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;163;-4528,1024;Inherit;False;3301.643;968.2485;Specular;38;201;200;199;198;197;196;195;194;193;192;191;190;189;188;187;186;185;184;183;182;181;180;179;178;177;176;175;174;173;172;171;170;169;168;167;166;165;164;Specular;1,0.8174672,0,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;402;-1689.181,-745.3542;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;380;-1539.243,-1166.982;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;385;-1311.856,-671.4261;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;355;-2166.906,-1276.274;Inherit;True;Property;_TextureSample4;Texture Sample 4;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;366;-1304.121,-891.2411;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;401;-1612.431,-988.105;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;289;-3360,-1744;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;291;-3472,-1936;Inherit;False;Constant;_Vector0;Vector 0;45;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ToggleSwitchNode;425;-3344,-2176;Inherit;False;Property;_ChangeAxis;ChangeAxis;48;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;175;-4480,1600;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;195;-4480,1424;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;177;-4480,1216;Inherit;False;Property;_SpecularTextureTiling;Specular Texture Tiling;27;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1408,176;Inherit;False;Property;_ShadowSize;ShadowSize;1;0;Create;True;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightAttenuation;493;-1552,496;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;381;-1344.021,-1161.348;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;384;-1142.509,-740.8118;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;400;-1649.831,-1266.853;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;367;-1147.673,-982.1275;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;292;-3168,-1936;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-3072,-1696;Inherit;False;Property;_GradientSize;Gradient Size;30;0;Create;True;0;0;0;False;0;False;0;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-2912,-1776;Inherit;False;Property;_GradientPosition;Gradient Position;33;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;7;-1344,352;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.CommentaryNode;87;-4528,-304;Inherit;False;2649.39;1146.548;;38;121;120;119;118;117;116;115;114;113;112;111;110;109;108;107;106;105;104;103;102;101;100;99;98;97;96;94;93;92;91;90;89;88;125;514;515;516;517;Rim;0,1,0.9419038,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;185;-4224,1456;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleNode;166;-4208,1360;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;513;-943.2129,206.5044;Inherit;False;ShadowSize;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;518;-1312,496;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.35;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;492;1616,-1616;Inherit;False;1319.844;577.5887;Comment;7;464;466;465;468;467;469;470;ShadowRamp;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;-1148.024,-1271.087;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;415;-837.721,-818.0474;Inherit;False;Property;_Level3;Level3;43;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;410;-845.5831,-956.655;Inherit;False;Property;_Level2;Level2;42;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;295;-2672,-1760;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;296;-2928,-1920;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;494;-1184,400;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;201;-3760,1472;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;196;-3744,1616;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;-4064,1360;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;164;-4080,1232;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;169;-3856,1392;Inherit;False;Property;_SpecularTextureRotation;Specular Texture Rotation;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewProjectionMatrixNode;110;-4384,720;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-4320,432;Inherit;False;Property;_RimTextureTiling;Rim Texture Tiling;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;120;-4352,560;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;117;-4512,80;Inherit;False;398;N;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;514;-4512,160;Inherit;False;513;ShadowSize;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;464;1664,-1264;Inherit;True;398;N;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;376;-481.5811,-923.3464;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0.2,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;299;-2800,-2352;Inherit;False;Property;_ColorA;Color A;25;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SmoothstepOpNode;297;-2528,-1936;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;298;-2800,-2176;Inherit;False;Property;_ColorB;Color B;24;0;Create;True;0;0;0;False;0;False;0,0.1264467,1,0;0,0.1264467,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.BreakToComponentsNode;63;-944,432;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;12;-1408,256;Inherit;False;Property;_ShadowBlend;ShadowBlend;2;0;Create;True;0;0;0;False;0;False;0.5391;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;198;-3776,1216;Inherit;False;Property;_SpecularTextureViewProjection;Specular Texture View Projection;23;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;167;-3504,1472;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RadiansOpNode;178;-3552,1360;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;200;-3504,1616;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-4064,704;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleNode;94;-4048,560;Inherit;False;1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;107;-4512,-240;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;106;-4512,-96;Float;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;516;-4304,96;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;466;1712,-1568;Inherit;True;Property;_TextureRamp;TextureRamp;54;0;Create;True;0;0;0;False;0;False;92af09dc061f8d3478a3c560ba7711bf;92af09dc061f8d3478a3c560ba7711bf;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ScaleAndOffsetNode;465;1904,-1232;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;392;-303.1357,-847.5854;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;406;-435.1505,-1301.912;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;216;-544,-1152;Inherit;False;Property;_ShadowColor;Shadow Color;10;0;Create;True;0;0;0;False;0;False;1,0,0,1;0.5377358,0.5377358,0.5377358,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode;302;-1968,-1984;Inherit;True;Property;_MainTexture;MainTexture;6;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;300;-1936,-2304;Inherit;False;Property;_DiffuseColor;Diffuse Color;3;0;Create;True;0;0;0;False;0;False;1,0.75,0.75,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp;301;-2256,-2192;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;-1104,224;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;62;-800,416;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;170;-3280,1472;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-2960,1456;Inherit;False;Property;_SpecularLightIntensity;Specular Light Intensity;34;0;Create;True;0;0;0;False;0;False;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-3408,1792;Inherit;False;Property;_SpecularSize;Specular Size;36;0;Create;True;0;0;0;False;0;False;0.005;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;182;-3328,1632;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LightColorNode;172;-2960,1344;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RotatorNode;199;-3376,1120;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;-3904,592;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;118;-3696,608;Inherit;False;Property;_RimTextureRotation;Rim Texture Rotation;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;99;-4016,416;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;114;-4512,240;Float;False;Property;_RimSize;Rim Size;15;0;Create;True;0;0;0;False;0;False;0.4104842;0;-1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;116;-4320,-160;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;515;-4128,96;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;223;1216,1024;Inherit;False;2697.641;988.0825;Outline;20;242;440;427;434;239;433;237;227;230;232;229;228;225;444;224;445;226;447;446;448;Outline;0,0,0,1;0;0
Node;AmplifyShaderEditor.SamplerNode;467;2064,-1568;Inherit;True;Property;_TextureSample5;Texture Sample 2;70;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;408;-201.2278,-1126.84;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;218;-195.4258,-1325.35;Inherit;False;Constant;_Color0;Color 0;5;0;Create;True;0;0;0;False;1;Header(SHADOWS);False;1,1,1,1;0.5377358,0.5377358,0.5377358,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;219;-74.79323,-872.6683;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;304;-1728,-1984;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;303;-1632,-2128;Inherit;False;Property;_UseGradient;Use Gradient;20;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;10;-944,-16;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;61;-656,448;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;191;-3312,1888;Inherit;False;Property;_SpecularBlend;Specular Blend;37;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;188;-3104,1088;Inherit;True;Property;_SpecularMap;Specular Map;21;1;[NoScaleOffset];Create;True;0;0;0;False;1;;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.NormalizeNode;190;-3120,1632;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;176;-3184,1264;Inherit;False;Property;_SpecularColor;Specular Color;31;0;Create;True;0;0;0;False;0;False;1,0.9575656,0.75,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;168;-3120,1808;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;165;-3120,1472;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-2720,1328;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RadiansOpNode;104;-3488,608;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;92;-3280,288;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;105;-3424,208;Inherit;False;Property;_RimLightIntensity;Rim Light Intensity;13;0;Create;True;0;0;0;False;0;False;0;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;119;-3696,464;Inherit;False;Property;_RimTextureViewProjection;Rim Texture View Projection;8;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-4512,320;Float;False;Property;_RimBlend;Rim Blend;16;0;Create;True;0;0;0;False;0;False;0.1;0;0.1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;89;-3952,96;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.19;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;125;-4192,240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;98;-4176,-128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;446;1232,1632;Inherit;False;Property;_XSpeed;XSpeed;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;447;1232,1696;Inherit;False;Property;_YSpeed;YSpeed;50;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;418;115.7107,-898.3214;Inherit;False;Property;_UseShadowTexture;UseShadowTexture;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;88.18073,-1217.016;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;470;2704,-1488;Inherit;False;ShadowRamp;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;306;-1136,-2064;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;179;-2928,1536;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;-2912,1808;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;181;-2768,1088;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;184;-2592,1232;Inherit;False;Property;_SpecLightColor;Spec Light Color;32;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RotatorNode;112;-3360,464;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;102;-3664,272;Inherit;True;Property;_RimTexture;Rim Texture;7;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-3008,272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;100;-3152,96;Float;False;Property;_RimColor;Rim Color;5;0;Create;True;0;0;0;False;0;False;0,1,0.8758622,0;0,0,0,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;93;-4032,272;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-3664,-128;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;226;1232,1472;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;224;1248,1888;Inherit;False;Property;_OutlineNoiseScale;OutlineNoiseScale;40;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;445;1360,1712;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;73;-496,-48;Inherit;True;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;220;368.9525,-937.7003;Inherit;False;Property;_UseShadow;UseShadow;26;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;304,-688;Inherit;True;470;ShadowRamp;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;307;-928,-2064;Inherit;True;MainColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;-848,288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;122;-256,-128;Inherit;False;NdotL;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;194;-2736,1536;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;-2384,1072;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;103;-2896,112;Inherit;False;Property;_RimLightColor;Rim Light Color;12;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;96;-3072,432;Inherit;True;Property;_RimTex;RimTex;25;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SmoothstepOpNode;517;-3424,16;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;444;1504,1632;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;225;1488,1776;Inherit;False;Property;_OutlineNoise;OutlineNoise;41;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;519;528,-784;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-432,448;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;75;-176,0;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;186;-2192,1072;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;183;-2240,1200;Inherit;False;122;NdotL;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;91;-2688,208;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;90;-2816,-128;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;228;1760,1664;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;229;1776,1520;Inherit;False;Property;_OutlineSize;Outline Size;39;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;463;1632,-880;Inherit;False;1614.629;488.5083;Comment;7;455;456;459;458;457;460;461;Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;832,-592;Inherit;False;307;MainColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;472;656,-896;Inherit;False;Property;_UseRamp;UseRamp;55;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;58;32,416;Inherit;True;Property;_Keyword0;Keyword 0;4;0;Create;True;0;0;0;False;0;False;0;0;0;False;UNITY_PASS_FORWARDADD;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;76;32,160;Inherit;True;Property;_Keyword0;Keyword 0;4;0;Create;True;0;0;0;False;0;False;0;0;0;False;UNITY_PASS_FORWARDADD;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;-1936,1072;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;-2496,0;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;305;-1344,-1888;Inherit;False;Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;455;1680,-624;Inherit;True;Property;_EmissiveMap;EmissiveMap;51;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;232;2048,1648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;448;1984,1504;Inherit;False;Property;_UseOutline;UseOutline;29;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;928,-880;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;85;1168,-160;Inherit;False;2370.848;1028.9;Comment;10;329;60;202;123;67;84;79;46;80;83;Mix;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;81;1103.963,-881.4384;Inherit;False;Shadow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;77;384,176;Inherit;True;LightingInfos;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;189;-1696,1072;Inherit;False;Property;_UseSpecular;UseSpecular;18;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;111;-2288,-32;Inherit;False;Property;_UseRim;UseRim;4;0;Create;True;0;0;0;False;0;False;1;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;230;2352,1392;Inherit;False;305;Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;456;1952,-624;Inherit;True;Property;_TextureSample2;Texture Sample 2;61;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;237;2224,1552;Inherit;False;Property;_OutlineNoise;OutlineNoise;37;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;227;2208,1168;Inherit;False;Property;_OutlineColor;Outline Color;38;1;[HDR];Create;True;0;0;0;False;0;False;0,0.07410216,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;78;672,416;Inherit;True;Lighting;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;193;-1488,1088;Inherit;True;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;121;-2080,-16;Inherit;True;Rim;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;239;2720,1232;Inherit;False;Property;_UseOutline;UseOutline;31;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;434;2560,1520;Inherit;False;Property;_UseOutline;UseOutline;31;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;433;2704,1376;Inherit;False;Property;_UseOutline;UseOutline;32;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;458;2256,-832;Inherit;False;Property;_EmissiveColor;EmissiveColor;53;1;[HDR];Create;True;0;0;0;False;0;False;2.996078,0.0611825,0,0;2.996078,0.0611825,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ComponentMaskNode;459;2272,-624;Inherit;False;True;True;True;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;83;1216,-64;Inherit;False;81;Shadow;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;1216,16;Inherit;False;77;LightingInfos;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;84;1200,208;Inherit;True;307;MainColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;79;1200,416;Inherit;True;78;Lighting;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OutlineNode;427;3008,1312;Inherit;False;0;False;Masked;1;0;Front;True;True;True;True;0;False;;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;457;2480,-640;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;46;1584,-80;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;67;1584,192;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;1584,416;Inherit;True;121;Rim;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;1584,640;Inherit;True;193;Specular;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;2624,144;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;460;2768,-672;Inherit;False;Property;_UseEmissive;UseEmissive;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;440;3376,1264;Inherit;False;Property;_UseOutline;UseOutline;31;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;461;3024,-672;Inherit;False;Emissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;350;3632,-1136;Inherit;False;835.2291;591.1036;Comment;5;499;0;331;462;244;Master;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;242;3632,1264;Inherit;False;Outline;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;329;3296,176;Inherit;True;Result;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;468;2240,-1248;Inherit;False;307;MainColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;497;-288,-976;Inherit;False;ShadowColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;462;3984,-1008;Inherit;False;461;Emissive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;3936,-720;Inherit;False;242;Outline;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;331;3968,-816;Inherit;False;329;Result;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;499;3680,-1072;Inherit;False;Constant;_Color1;Color 1;65;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;469;2512,-1328;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;4208,-1072;Float;False;True;-1;2;TatoonEditor_OutlineIncluded;0;0;CustomLighting;TetraArts/Tatoon2/Built-in/Tatoon2_Built-in_Outlined;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;AlphaTest;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;5;False;;0;False;;0;5;False;;1;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;208;0;204;0
WireConnection;208;1;205;0
WireConnection;207;0;206;0
WireConnection;210;0;207;0
WireConnection;210;1;208;0
WireConnection;423;0;421;0
WireConnection;423;1;422;0
WireConnection;403;0;210;0
WireConnection;403;2;423;0
WireConnection;363;0;211;0
WireConnection;363;1;365;0
WireConnection;362;0;211;0
WireConnection;362;1;364;0
WireConnection;209;0;206;0
WireConnection;416;0;210;0
WireConnection;416;1;403;0
WireConnection;3;0;1;0
WireConnection;3;1;2;0
WireConnection;398;0;3;0
WireConnection;213;0;209;0
WireConnection;213;1;416;0
WireConnection;212;0;362;0
WireConnection;361;0;363;0
WireConnection;357;0;211;0
WireConnection;360;0;213;0
WireConnection;360;2;361;0
WireConnection;214;0;213;0
WireConnection;214;2;212;0
WireConnection;217;0;215;0
WireConnection;217;1;214;0
WireConnection;399;0;369;0
WireConnection;356;0;213;0
WireConnection;356;2;357;0
WireConnection;359;0;215;0
WireConnection;359;1;360;0
WireConnection;386;0;387;0
WireConnection;290;0;287;1
WireConnection;290;1;287;2
WireConnection;424;0;287;2
WireConnection;424;1;287;3
WireConnection;402;0;359;0
WireConnection;380;0;377;0
WireConnection;385;0;386;0
WireConnection;355;0;215;0
WireConnection;355;1;356;0
WireConnection;366;0;399;0
WireConnection;401;0;217;0
WireConnection;289;0;288;0
WireConnection;425;0;290;0
WireConnection;425;1;424;0
WireConnection;381;0;380;0
WireConnection;384;0;402;0
WireConnection;384;1;385;0
WireConnection;400;0;355;0
WireConnection;367;0;401;0
WireConnection;367;1;366;0
WireConnection;292;0;425;0
WireConnection;292;1;291;0
WireConnection;292;2;289;0
WireConnection;185;0;195;0
WireConnection;185;1;175;0
WireConnection;166;0;177;0
WireConnection;513;0;11;0
WireConnection;518;0;493;0
WireConnection;382;0;400;0
WireConnection;382;1;381;0
WireConnection;415;1;384;0
WireConnection;410;1;367;0
WireConnection;295;0;294;0
WireConnection;295;1;293;0
WireConnection;296;0;292;0
WireConnection;494;0;7;1
WireConnection;494;1;518;0
WireConnection;180;0;166;0
WireConnection;180;1;185;0
WireConnection;164;0;177;0
WireConnection;376;0;382;0
WireConnection;376;1;410;0
WireConnection;376;2;415;0
WireConnection;297;0;296;0
WireConnection;297;1;294;0
WireConnection;297;2;295;0
WireConnection;63;0;494;0
WireConnection;198;0;164;0
WireConnection;198;1;180;0
WireConnection;167;0;201;0
WireConnection;178;0;169;0
WireConnection;200;0;196;0
WireConnection;101;0;120;0
WireConnection;101;1;110;0
WireConnection;94;0;88;0
WireConnection;516;0;117;0
WireConnection;516;1;514;0
WireConnection;465;0;464;0
WireConnection;392;0;376;0
WireConnection;301;0;299;0
WireConnection;301;1;298;0
WireConnection;301;2;297;0
WireConnection;13;0;11;0
WireConnection;13;1;12;0
WireConnection;62;0;63;0
WireConnection;62;1;63;1
WireConnection;170;0;167;0
WireConnection;170;1;200;0
WireConnection;199;0;198;0
WireConnection;199;2;178;0
WireConnection;108;0;94;0
WireConnection;108;1;101;0
WireConnection;99;0;88;0
WireConnection;116;0;107;0
WireConnection;116;1;106;0
WireConnection;515;0;516;0
WireConnection;467;0;466;0
WireConnection;467;1;465;0
WireConnection;408;0;406;1
WireConnection;408;1;216;0
WireConnection;219;0;216;0
WireConnection;219;1;392;0
WireConnection;304;0;302;0
WireConnection;303;0;300;0
WireConnection;303;1;301;0
WireConnection;10;0;3;0
WireConnection;10;1;11;0
WireConnection;10;2;13;0
WireConnection;61;0;62;0
WireConnection;61;1;63;2
WireConnection;188;1;199;0
WireConnection;190;0;182;0
WireConnection;168;0;171;0
WireConnection;165;0;170;0
WireConnection;192;0;172;0
WireConnection;192;1;187;0
WireConnection;104;0;118;0
WireConnection;119;0;99;0
WireConnection;119;1;108;0
WireConnection;89;0;515;0
WireConnection;125;0;114;0
WireConnection;98;0;116;0
WireConnection;418;0;408;0
WireConnection;418;1;219;0
WireConnection;407;0;218;0
WireConnection;407;1;406;1
WireConnection;470;0;467;0
WireConnection;306;0;303;0
WireConnection;306;1;304;0
WireConnection;179;0;165;0
WireConnection;179;1;190;0
WireConnection;197;0;168;0
WireConnection;197;1;191;0
WireConnection;181;0;188;0
WireConnection;184;0;176;0
WireConnection;184;1;192;0
WireConnection;112;0;119;0
WireConnection;112;2;104;0
WireConnection;97;0;105;0
WireConnection;97;1;92;1
WireConnection;93;0;125;0
WireConnection;93;1;109;0
WireConnection;115;0;98;0
WireConnection;115;1;89;0
WireConnection;445;0;446;0
WireConnection;445;1;447;0
WireConnection;73;0;10;0
WireConnection;73;1;61;0
WireConnection;220;0;407;0
WireConnection;220;1;418;0
WireConnection;307;0;306;0
WireConnection;64;0;10;0
WireConnection;64;1;494;0
WireConnection;122;0;73;0
WireConnection;194;0;179;0
WireConnection;194;1;168;0
WireConnection;194;2;197;0
WireConnection;174;0;181;0
WireConnection;174;1;184;0
WireConnection;103;0;100;0
WireConnection;103;1;97;0
WireConnection;96;0;102;0
WireConnection;96;1;112;0
WireConnection;517;0;115;0
WireConnection;517;1;125;0
WireConnection;517;2;93;0
WireConnection;444;0;226;0
WireConnection;444;2;445;0
WireConnection;225;1;224;0
WireConnection;519;0;220;0
WireConnection;519;1;471;0
WireConnection;71;0;64;0
WireConnection;71;1;61;0
WireConnection;75;0;73;0
WireConnection;186;0;174;0
WireConnection;186;1;194;0
WireConnection;91;0;103;0
WireConnection;91;1;96;0
WireConnection;90;0;517;0
WireConnection;228;0;444;0
WireConnection;228;1;225;0
WireConnection;472;0;220;0
WireConnection;472;1;519;0
WireConnection;58;1;71;0
WireConnection;58;0;64;0
WireConnection;76;1;75;0
WireConnection;76;0;64;0
WireConnection;173;0;186;0
WireConnection;173;1;183;0
WireConnection;113;0;90;0
WireConnection;113;1;91;0
WireConnection;305;0;304;4
WireConnection;232;0;229;0
WireConnection;232;1;228;0
WireConnection;448;1;229;0
WireConnection;18;0;472;0
WireConnection;18;1;86;0
WireConnection;81;0;18;0
WireConnection;77;0;76;0
WireConnection;189;1;173;0
WireConnection;111;1;113;0
WireConnection;456;0;455;0
WireConnection;237;0;448;0
WireConnection;237;1;232;0
WireConnection;78;0;58;0
WireConnection;193;0;189;0
WireConnection;121;0;111;0
WireConnection;239;1;227;0
WireConnection;434;1;237;0
WireConnection;433;1;230;0
WireConnection;459;0;456;0
WireConnection;427;0;239;0
WireConnection;427;2;433;0
WireConnection;427;1;434;0
WireConnection;457;0;458;0
WireConnection;457;1;459;0
WireConnection;46;1;83;0
WireConnection;46;2;80;0
WireConnection;67;1;84;0
WireConnection;67;2;79;0
WireConnection;60;0;46;0
WireConnection;60;1;67;0
WireConnection;60;2;202;0
WireConnection;60;3;123;0
WireConnection;460;1;457;0
WireConnection;440;1;427;0
WireConnection;461;0;460;0
WireConnection;242;0;440;0
WireConnection;329;0;60;0
WireConnection;497;0;216;0
WireConnection;469;1;468;0
WireConnection;0;0;499;0
WireConnection;0;2;462;0
WireConnection;0;13;331;0
WireConnection;0;11;244;0
ASEEND*/
//CHKSM=F2FC31B84FBD28864073CC1BF593D468DC6A90E0