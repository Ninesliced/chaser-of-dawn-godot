extends CharacterBody2D
class_name Player

@export var speed: float = 200.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_animation_component_on_die_animation_finished() -> void:
	Global.game_over()
	pass # Replace with function body.
