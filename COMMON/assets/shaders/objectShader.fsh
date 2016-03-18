#ifdef GL_ES
precision mediump float;
#endif

//varying vec4 destinationNormal;
varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;

uniform sampler2D diffuseTexture2D;
uniform sampler2D ambientTexture2D;
uniform sampler2D specularTexture2D;
uniform sampler2D normalTexture2D;
uniform sampler2D reflectiveTexture2D;
uniform sampler2D emissionTexture2D;
uniform sampler2D transparentTexture2D;
uniform sampler2D multiplyTexture2D;

uniform     int         u_opacityModifyRGB;




void main(void)
{
    if(destinationHidden != 0.0)
    {
        discard;
    }
    
//    vec4 dummy2 = destinationNormal;
    vec4 color;// = destinationColor;
    int modifyRGB = u_opacityModifyRGB;
//    vec2 pointSpriteCoord = gl_PointCoord;
    
    vec4 diffuseColor = texture2D(diffuseTexture2D, destinationTexCoord2D);
//    vec4 ambientColor = texture2D(ambientTexture2D, destinationTexCoord2D);
//    vec4 specularColor = texture2D(specularTexture2D, destinationTexCoord2D);
//    vec4 normalColor = texture2D(normalTexture2D, destinationTexCoord2D);
//    vec4 reflectiveColor = texture2D(reflectiveTexture2D, destinationTexCoord2D);
//    vec4 emissionColor = texture2D(emissionTexture2D, destinationTexCoord2D);
//    vec4 transparentColor = texture2D(transparentTexture2D, destinationTexCoord2D);
//    vec4 multiplyColor = texture2D(multiplyTexture2D, destinationTexCoord2D);
    
    if (modifyRGB == 1) {
        color = vec4(destinationColor.r * destinationColor.a,
                     destinationColor.g * destinationColor.a,
                     destinationColor.b * destinationColor.a,
                     destinationColor.a);
    } else {
        color = destinationColor;
    }
    
    /*vec4 finalColor = color *
    diffuseColor *
    ambientColor *
    specularColor *
    normalColor *
    reflectiveColor *
    emissionColor *
    transparentColor *
    multiplyColor;*/
    
    vec4 finalColor = color * diffuseColor;
    float nodeOpacity = finalColor.a * destinationOpacity;
    
    if (nodeOpacity == 0.0)
    {
        discard;
    }
    
    
    
    
    
    
    
    gl_FragColor = vec4(finalColor.r, finalColor.g, finalColor.b, nodeOpacity);
}
