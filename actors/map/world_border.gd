extends Node2D

const tile_width := 8.

signal border_touched

var border_x := 0.

@export var speed := 250.

@onready var visible_borders := $VisibleBorders
@onready var dither_mask := $VisibleBorders/DitherMaskTileMap


func _process(delta: float) -> void:
	border_x += 1000. / speed * delta
	
	if border_x > tile_width:
		border_x -= tile_width
		position.x += tile_width

	dither_mask.material.set("shader_parameter/mask_offset", position)

	visible_borders.position.x = round(border_x)

func _on_concrete_border_collisions_body_entered(body: Node2D) -> void:
	if body is not Player:
		return

	border_touched.emit()


func _on_concrete_border_collisions_body_exited(body: Node2D) -> void:
	if body is not Player:
		return

	border_touched.emit()
