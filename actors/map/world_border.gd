extends Node2D

const tile_width := 8.

@export var visible_border: Node2D
@export var speed := 250. # 10.


func _process(delta: float) -> void:
	visible_border.position.x += 1000. / speed * delta
	
	if visible_border.position.x > tile_width:
		visible_border.position.x -= tile_width
		position.x += tile_width

	position.x = fmod(position.x, tile_width * 2.)
