#version 330 core

#define M_PI 3.14159265359

struct BaseLight
{
    vec3 Color;
    float AmbientIntensity;
    float DiffuseIntensity;
};

struct DirectionalLight
{
    BaseLight Base;
    vec3 Direction;
};

uniform sampler2DArray GBuffer;
uniform DirectionalLight gDirectionalLight;
uniform vec3 gEyeWorldPos;
uniform float gMatSpecularIntensity;
uniform float gSpecularPower;
uniform vec2 gScreenSize;

layout (location = 4) out vec4 FragColor;

vec2 CalcTexCoord()
{
   	return gl_FragCoord.xy / gScreenSize;
}

float F_Schlick (in float f0, in float f90, in float u)
{
	return f0 + ( f90 - f0 ) * pow(clamp(1.0 - u, 0.0, 1.0), 5.0);
}

 float Fr_DisneyDiffuse ( float dotNV , float dotNL , float dotLH , float linearRoughness )
{
	float energyBias = mix(0 , 0.5 , linearRoughness);
	float energyFactor = mix(1.0 , 1.0 / 1.51 , linearRoughness);
	float fd90 = energyBias + 2.0 * dotLH * dotLH * linearRoughness;
	const float f0 = 1.0;
	float lightScatter = F_Schlick(f0 , fd90 , dotNL);
	float viewScatter = F_Schlick(f0 , fd90 , dotNV);
	
	return lightScatter * viewScatter * energyFactor;
}

float GGX_D(float dotNH, float alpha)
{
	float m_alpha = pow(alpha, 2.0);
	return m_alpha / (M_PI * pow( pow(dotNH, 2.0) * (m_alpha - 1.0) + 1.0 , 2.0));
}

float G1(float dotNV, float k)
{
	return dotNV / (dotNV * (1.0 - k) + k);
}

float GGX_G(float dotNL, float dotNV, float roughness)
{
	float k = pow(roughness + 1.0, 2.0) / 8;
	return G1(dotNL, k) * G1(dotNV, k);
}

float GGX_F(float dotVH, float F0)
{
	float powerForTwo = (-5.55473 * dotVH - 6.98316) * dotVH;
	return mix(pow(2.0, powerForTwo), 1.0, F0);
}

float PBR(vec3 N, vec3 V, vec3 L, float roughness, float f0)
{
	
	vec3 H = normalize (V + L);
	float dotNV = abs(dot(N, V));
	float dotNL = abs(dot(N, L));
	float dotLH = clamp(dot(L, H), 0.0, 1.0);
	float dotNH = clamp(dot(N, H), 0.0, 1.0);
	
	float f90 = clamp(50.0 * dot (f0 , 0.33), 0.0, 1.0);
	float alpha = pow(roughness, 2.0);
	
	// Specular BRDF
	float F = GGX_F(clamp(dot(V, H), 0.0, 1.0), f0);
	float D = GGX_D(dotNH, alpha);;
	float G = GGX_G(dotNL, dotNV, roughness);
	float Fr = D * F * G / (4 * dotNL * dotNV);
	
	// Diffuse BRDF
	float Fd = Fr_DisneyDiffuse(dotNV, dotNL, dotLH, roughness) / M_PI;

	return Fr + Fd;

}

void main()
{
   	vec2 TexCoord = CalcTexCoord();
   	vec3 WorldPos = texture(GBuffer, vec3(TexCoord.xy, 0)).xyz;
   	vec3 Color = texture(GBuffer, vec3(TexCoord.xy, 1)).xyz;
   	vec3 Normal = normalize(texture(GBuffer, vec3(TexCoord.xy, 2)).xyz);
	vec3 ViewDirection = normalize(gEyeWorldPos - WorldPos);
	
	// Set material parameters
	vec3 surface = vec3(0.7, 0.7, 0.4);   
    	float reflectance = surface.r;
    	//float roughness = clamp(surface.g - EPSILON,0.0,1.0) + EPSILON;
	float roughness = surface.g;
    	float metallic = surface.b;

	float F0 = 0.16 * pow(reflectance, 2.0);
	
    	float result = PBR(Normal, ViewDirection, gDirectionalLight.Direction, roughness, F0);
	
	FragColor = vec4( result * Color , 1.0);
}