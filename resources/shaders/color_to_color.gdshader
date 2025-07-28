shader_type canvas_item;

uniform vec4 color : source_color;
uniform vec4 to_color : source_color;


void vertex() {
}

void fragment() {
	COLOR = mix(COLOR, to_color, float(COLOR.rgb == color.rgb));
}
