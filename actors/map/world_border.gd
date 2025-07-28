extends Node2D

const tile_width := 8.

signal border_touched

@export var visible_border: Node2D
@export var speed := 250.


func _process(delta: float) -> void:
	visible_border.position.x += 1000. / speed * delta
	
	if visible_border.position.x > tile_width:
		visible_border.position.x -= tile_width
		position.x += tile_width


func _on_concrete_border_collisions_body_entered(body: Node2D) -> void:
	if body is not Player:
		return

	border_touched.emit()


func _on_concrete_border_collisions_body_exited(body: Node2D) -> void:
	if body is not Player:
		return

	border_touched.emit()
