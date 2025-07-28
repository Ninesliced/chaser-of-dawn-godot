shader_type canvas_item;

void vertex() {
}

void fragment() {
	COLOR = vec4(COLOR.rgb, float(COLOR.rgb != vec3(0.0,0.0,0.0)));
}
