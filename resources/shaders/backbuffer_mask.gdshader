shader_type canvas_item;
render_mode unshaded;

uniform sampler2D world_texture : filter_nearest, repeat_enable;
uniform vec2 world_texture_size = vec2(128., 128.);
uniform vec2 world_tile_size = vec2(8., 8.);

varying vec2 world_space;

void vertex()
{
	world_space = (MODEL_MATRIX * vec4(VERTEX, 0., 1.)).xy;
}

void fragment()
{
	COLOR = texture(world_texture, mod(world_space, world_tile_size) / world_texture_size);
}