#version 300 es
uniform sampler2D  sBaseTex;
uniform sampler2D  sNormalMap;
		
in lowp    vec3  LightVec;
in mediump vec2  TexCoord;

layout (location = 0) out lowp vec4 oColour;

void main()
{
	// read the per-pixel normal from the normal map and expand to [-1, 1]
	lowp vec3 normal = texture(sNormalMap, TexCoord).rgb * 2.0 - 1.0;
	
	// linear interpolations of normals may cause shortened normals and thus
	// visible artifacts on low-poly models.
	// We omit the normalization here for performance reasons
	
	// calculate diffuse lighting as the cosine of the angle between light
	// direction and surface normal (both in surface local/tangent space)
	// We don't have to clamp to 0 here because the framebuffer write will be clamped
	lowp float lightIntensity = dot(LightVec, normal);

	// read base texture and modulate with light intensity
	lowp vec3 texColor = texture(sBaseTex, TexCoord).rgb;	
	oColour = vec4(texColor * lightIntensity, 1.0);
}
