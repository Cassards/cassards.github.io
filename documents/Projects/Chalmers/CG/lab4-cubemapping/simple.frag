#version 420

// required by GLSL spec Sect 4.5.3 (though nvidia does not, amd does)
precision highp float;

///////////////////////////////////////////////////////////////////////////////
// Material
///////////////////////////////////////////////////////////////////////////////
uniform vec3 material_color;
uniform float material_reflectivity;
uniform float material_metalness;
uniform float material_fresnel;
uniform float material_shininess;
uniform float material_emission;

///////////////////////////////////////////////////////////////////////////////
// Environment
///////////////////////////////////////////////////////////////////////////////
layout(binding = 6) uniform sampler2D environmentMap;
layout(binding = 7) uniform sampler2D irradianceMap;
layout(binding = 8) uniform sampler2D reflectionMap;
uniform float environment_multiplier;

///////////////////////////////////////////////////////////////////////////////
// Light source
///////////////////////////////////////////////////////////////////////////////
uniform vec3 point_light_color = vec3(1.0, 1.0, 1.0);
uniform float point_light_intensity_multiplier = 50.0;

///////////////////////////////////////////////////////////////////////////////
// Constants
///////////////////////////////////////////////////////////////////////////////
#define PI 3.14159265359

///////////////////////////////////////////////////////////////////////////////
// Input varyings from vertex shader
///////////////////////////////////////////////////////////////////////////////
in vec2 texCoord;
in vec3 viewSpaceNormal; 
in vec3 viewSpacePosition; 

///////////////////////////////////////////////////////////////////////////////
// Input uniform variables
///////////////////////////////////////////////////////////////////////////////
uniform mat4 viewInverse; 
uniform vec3 viewSpaceLightPosition;

///////////////////////////////////////////////////////////////////////////////
// Output color
///////////////////////////////////////////////////////////////////////////////
layout(location = 0) out vec4 fragmentColor;


vec3 calculateDirectIllumiunation(vec3 wo, vec3 n)
{
	///////////////////////////////////////////////////////////////////////////
	// Task 1.2 - Calculate the radiance Li from the light, and the direction
	//            to the light. If the light is backfacing the triangle, 
	//            return vec3(0); 
	///////////////////////////////////////////////////////////////////////////

    vec3 lightVector = viewSpaceLightPosition - viewSpacePosition;
    
    float d = length(lightVector);
    vec3 wi = normalize(lightVector);
    

    if (dot(wi, n) <= 0){
        return vec3(0.0);
    }
    
    vec3 Li = point_light_intensity_multiplier * point_light_color * 1/(d*d);

    

	///////////////////////////////////////////////////////////////////////////
	// Task 1.3 - Calculate the diffuse term and return that as the result
	///////////////////////////////////////////////////////////////////////////
	vec3 diffuse_term = material_color * 1.0 / PI * length(dot(n, wi)) * Li;
    
    //return diffuse_term;                                                            // <--- simple diffuse surface
    
	///////////////////////////////////////////////////////////////////////////
	// Task 2 - Calculate the Torrance Sparrow BRDF and return the light 
	//          reflected from that instead
	///////////////////////////////////////////////////////////////////////////
    vec3 wh = normalize(wi+wo);
    float F = material_fresnel + (1 - material_fresnel) * pow((1 - dot(wh, wi)), 5);
    float D = (material_shininess + 2)/(2*PI) * pow(dot(n, wh), material_shininess);
    float G = min(1, min(2*(dot(n, wh)*dot(n, wo))/(dot(wo, wh)), 2*(dot(n, wh)*dot(n, wi))/(dot(wo, wh))));

    float brdf = (F*D*G)/(4*dot(n, wo)*dot(n,wi));
    //return brdf * dot(n, wi) * Li;                                                 // <--- brdf shader

	///////////////////////////////////////////////////////////////////////////
	// Task 3 - Make your shader respect the parameters of our material model.
	///////////////////////////////////////////////////////////////////////////

    vec3 dielectric_term = brdf * dot(n, wi)*Li + (1 - F) * diffuse_term;
    vec3 metal_term = brdf * material_color * dot(n, wi)*Li;
    vec3 microfacet_term = material_metalness * metal_term + (1 - material_metalness) * dielectric_term;
    
    return material_reflectivity * microfacet_term + (1-material_reflectivity) * diffuse_term;

	//return vec3(material_color);
}

vec3 calculateIndirectIllumination(vec3 wo, vec3 n)
{
	///////////////////////////////////////////////////////////////////////////
	// Task 5 - Lookup the irradiance from the irradiance map and calculate
	//          the diffuse reflection
	///////////////////////////////////////////////////////////////////////////
	
    // Calculate the spherical coordinates of the direction
    vec4 worldSpaceNormal = viewInverse * vec4(n.x, n.y, n.z, 0.0);
        
    float theta = acos(max(-1.0f, min(1.0f, worldSpaceNormal.y)));
    float phi = atan(worldSpaceNormal.z, worldSpaceNormal.x);
    if (phi < 0.0f) phi = phi + 2.0f * PI;
	
    // Use these to lookup the color in the irradiance map
    vec2 lookup = vec2(phi / (2.0 * PI), theta / PI);
    vec4 irradiance = environment_multiplier * texture(irradianceMap, lookup);
	    
    vec3 diffuse_term = material_color * (1.0 / PI) * vec3(irradiance);

    //return diffuse_term;

    ///////////////////////////////////////////////////////////////////////////
	// Task 6 - Look up in the reflection map from the perfect specular 
	//          direction and calculate the dielectric and metal terms. 
	///////////////////////////////////////////////////////////////////////////

    vec3 wi = normalize(reflect(-wo,n));
    vec3 wh = normalize(wi+wo);
    vec4 worldSpaceWi = viewInverse * vec4(wi.x, wi.y, wi.z, 0.0);
    
    //Compute lookup 
    float theta2 = acos(max(-1.0f, min(1.0f, worldSpaceWi.y)));
    float phi2 = atan(worldSpaceWi.z, worldSpaceWi.x);
    if (phi < 0.0f) phi2 = phi2 + 2.0f * PI;
	
    // Use these to lookup the color in the irradiance map
    vec2 lookup2 = vec2(phi2 / (2.0 * PI), theta2 / PI);

    float roughness = sqrt(sqrt( 2.0/(material_shininess + 2) ));

    vec3 Li = environment_multiplier * textureLod(reflectionMap, lookup2, roughness * 7.0).xyz;
    float F = material_fresnel + (1 - material_fresnel) * pow((1 - dot(wh, wi)), 5);

    vec3 dielectric_term = F*Li+(1-F)*diffuse_term;
    vec3 metal_term = F * material_color * Li;
    vec3 microfacet_term = material_metalness * metal_term + (1 - material_metalness) * dielectric_term; 
    
    return material_reflectivity * microfacet_term + (1 - material_reflectivity) * diffuse_term;
}


void main()
{
	///////////////////////////////////////////////////////////////////////////
	// Task 1.1 - Fill in the outgoing direction, wo, and the normal, n. Both
	//            shall be normalized vectors in view-space. 
	///////////////////////////////////////////////////////////////////////////
	vec3 wo = normalize(-viewSpacePosition);
	vec3 n = normalize(viewSpaceNormal);

	vec3 direct_illumination_term = vec3(0.0);
	{ // Direct illumination
		direct_illumination_term = calculateDirectIllumiunation(wo, n);
	}

	vec3 indirect_illumination_term = vec3(0.0);
	{ // Indirect illumination
		indirect_illumination_term = calculateIndirectIllumination(wo, n);
	}

	///////////////////////////////////////////////////////////////////////////
	// Task 7 - Make glowy things glow!
	///////////////////////////////////////////////////////////////////////////
    vec3 emission_term = material_emission * material_color;
	
    fragmentColor.xyz =
		direct_illumination_term +
		indirect_illumination_term +
		emission_term;
}
