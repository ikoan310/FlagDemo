Shader "Custom/Flag"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
        _NumTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" }
        LOD 100
        
        Pass
        {
            Blend srcAlpha oneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            #include "Flag_inc.cginc"
            
            sampler2D _MainTex;
            float4 _MainTex_ST;
            
            flag_v2f vert (flag_appdata v)
            {
                flag_v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                fixed amp = sin( _Time.x * 60 + o.uv.x * 3 + o.uv.y * 1 ) * 0.2;
                o.vertex.y += amp;
                return o;
            }
            
            fixed4 frag (flag_v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                return col;
            }
            
            ENDCG
        }
        Pass
        {
            Blend One SrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            #include "Flag_inc.cginc"
            
            sampler2D _NumTex;
            float4 _NumTex_ST;
            
            flag_v2f vert (flag_appdata v)
            {
                flag_v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _NumTex);
                fixed amp = sin( _Time.x * 60 + o.uv.x * 3 + o.uv.y * 1 ) * 0.2;
                o.vertex.y += amp;
                return o;
            }
            
            fixed4 frag (flag_v2f i) : SV_Target
            {
                fixed4 col = tex2D(_NumTex, i.uv);
                return col;
            }
            
            ENDCG
        }
	}
}
