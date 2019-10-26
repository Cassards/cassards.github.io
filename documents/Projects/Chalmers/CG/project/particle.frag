#version 420 
in float life;
uniform float screen_x;
uniform float screen_y;
layout(binding = 0) uniform sampler2D colortexture;

layout(location = 0) out vec4 fragmentColor;

void main()
{
    // Basse color.
    fragmentColor = texture2D(colortexture,gl_PointCoord);
    // Make it darker the older it is.
    fragmentColor.xyz *= (1.0-life);
    // Make it fade out the older it is, also all particles have a 
    // very low base alpha so they blend together.
    fragmentColor.w = fragmentColor.w * (1.0-pow(life, 4.0))*0.05;
}
