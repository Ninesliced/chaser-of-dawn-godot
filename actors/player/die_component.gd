extends Node
class_name DieComponent

var alive = true
signal on_die

func _on_hitbox_component_area_entered(area:Area2D) -> void:
    alive = false
    emit_signal("on_die")
