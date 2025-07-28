shader_type canvas_item;
render_mode unshaded;

uniform sampler2D world_texture : filter_nearest, source_color;
uniform vec2 world_texture_size = vec2(128.0, 128.0);

varying vec2 world_space;

void vertex()
{
	world_space = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment()
{
	float mask = texture(TEXTURE, UV).a;
	vec4 color = texture(world_texture, world_space / world_texture_size);

	COLOR.rgb = color.rgb;
	color.a = color.a * mask;
}