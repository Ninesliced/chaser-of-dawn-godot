shader_type canvas_item;
render_mode unshaded;

uniform sampler2D world_texture : filter_nearest;
uniform vec2 world_texture_size = vec2(128., 128.);

varying vec2 world_space;

void vertex()
{
	world_space = (MODEL_MATRIX * vec4(VERTEX, 0., 1.)).xy;
}

void fragment()
{
	//float mask = texture(TEXTURE, UV).a;
	vec4 color = texture(world_texture, world_space / world_texture_size);

	//COLOR.rgb = color.rgb;
	//COLOR.rgb = vec3(UV.x);
	COLOR = color;
	//color.a = color.a * mask;
}