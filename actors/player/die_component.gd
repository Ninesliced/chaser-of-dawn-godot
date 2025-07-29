extends Node
class_name DieComponent

var alive = true
signal on_die(reason: String)

func _on_hitbox_component_area_entered(area:Area2D) -> void:
    var reason = "cold"
    if abs(get_parent().global_position.x - area.global_position.x) < 16:
        reason = "hot"
    alive = false
    on_die.emit(reason)
