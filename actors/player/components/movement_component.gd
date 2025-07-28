extends Node

var player: Player

func _ready() -> void:
    var parent = get_parent()
    if parent is Player:
        player = parent
    else:
        assert(false, "MovementComponent must be a child of Player")

func _physics_process(delta: float) -> void:
    var vector : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    player.velocity = vector.normalized() * player.speed
    player.move_and_slide()