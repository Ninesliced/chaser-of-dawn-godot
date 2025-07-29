shader_type canvas_item;
render_mode unshaded;

uniform vec2 mask_offset;

uniform vec4 hot_mask_color = vec4(1., 0.639, 0., 1.);
uniform vec4 cold_mask_color = vec4(.5, 0.145, 0.325, 1.);

uniform sampler2D world_texture : filter_nearest, repeat_enable;
uniform vec2 world_texture_size = vec2(128., 128.);
uniform vec2 world_tile_size = vec2(8., 8.);

varying vec2 world_space;

float fsmod(float x, float v)
{
	float k = .5;
	float n = x / v;

	return (k + sign(x) * mod(n, k)) * v;
}

vec2 fsmod(vec2 o, vec2 v)
{
	return vec2(
		fsmod(o.x, v.x),
		mod(o.y, v.y)
	);
}

void vertex()
{
	// world_space = (MODEL_MATRIX * vec4(VERTEX, 0., 1.)).xy;
	world_space = VERTEX + mask_offset;
}

void fragment()
{
	vec2 local_world_space = fsmod(
		VERTEX - world_texture_size / 2.,
		world_texture_size
	);

	vec2 local_color_space = fsmod(
		VERTEX - world_texture_size / 2.,
		vec2(1.)
	);

	COLOR = texture(world_texture, VERTEX / world_texture_size);

	if (local_color_space.x < .5)
	{
		COLOR *= hot_mask_color;
	}
	else
	{
		COLOR *= cold_mask_color;
	}
}