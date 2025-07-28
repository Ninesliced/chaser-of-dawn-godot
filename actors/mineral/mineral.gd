@tool
extends Node2D

class_name MineralOre

@onready var texture: Sprite2D = $Texture

@export var data: Mineral:
	set(x):
		data = x
		refresh_sprite()

func refresh_sprite() -> void:
	if self.texture == null:
		return
	self.texture.texture = data.sprite if data else null

func _ready() -> void:	
	refresh_sprite()
