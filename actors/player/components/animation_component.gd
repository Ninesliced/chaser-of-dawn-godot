extends Node

@export var animated_sprite: AnimatedSprite2D

signal on_die_animation_finished

func _on_movement_component_on_vector(vector: Vector2) -> void:
    if animated_sprite.animation in ["cold", "hot"]:
        return
    if vector == Vector2.ZERO:
        animated_sprite.stop()
    if vector.x > 0:
        animated_sprite.play("right")
    elif vector.x < 0:
        animated_sprite.play("left")
    elif vector.y < 0:
        animated_sprite.play("up")
    elif vector.y > 0:
        animated_sprite.play("down")
    pass # Replace with function body.


func _on_die_component_on_die(reason: String) -> void:
    print("Player died due to: ", reason)
    animated_sprite.play(reason)
    await animated_sprite.animation_finished
    emit_signal("on_die_animation_finished")
