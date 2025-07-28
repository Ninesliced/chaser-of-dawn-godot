extends Node2D

@export var speed := 10.


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	print(speed / 1000. * delta)
	position.x += delta
