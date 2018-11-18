
#ifndef FLAGINC_INCLUDED
#define FLAGINC_INCLUDED

struct flag_appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
};

struct flag_v2f
{
    float2 uv : TEXCOORD0;
    float4 vertex : SV_POSITION;
};


#endif
