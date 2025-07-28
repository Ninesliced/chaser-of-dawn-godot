extends Control
class_name PlayExplain
@export var scene_to_load: PackedScene

func _input(event: InputEvent) -> void:
    if !visible:
        return
    if event.is_action_pressed("c"):
        get_tree().change_scene_to_packed(scene_to_load)
