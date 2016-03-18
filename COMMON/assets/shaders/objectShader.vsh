attribute vec4 inPosition;
attribute vec4 inNormal;
attribute vec2 inTexCoord;
attribute vec4 inColor;
attribute mat4 inTransform;
attribute float inOpacity;
attribute float inHidden;

//varying vec4 destinationNormal;
varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;

uniform mat4 modelView;
uniform mat4 projection;
uniform float u_pointSize;

void main(void)
{
//    destinationNormal = inNormal;
    destinationColor = inColor;
    destinationTexCoord2D = inTexCoord;
    destinationOpacity = inOpacity;
    destinationHidden = inHidden;
    
    mat4 transform = inTransform;
//    transform = mat4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    
//    gl_PointSize = u_pointSize;
    gl_Position = projection * modelView * transform * inPosition;
}
