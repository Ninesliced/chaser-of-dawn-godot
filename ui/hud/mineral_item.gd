extends Node2D

@export var type: Mineral

func _ready() -> void:
	print(type)
	if type && type.sprite:
		%Mineral.texture = type.sprite
