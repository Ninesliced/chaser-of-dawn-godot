extends Control

@export var scene_to_load: PackedScene

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("x"):
        get_tree().change_scene_to_packed(scene_to_load)