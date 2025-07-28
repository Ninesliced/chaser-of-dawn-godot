extends Node2D

@export var speed := 250.


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	position.x += delta * speed
