extends Node

var player: Player
const MAP_HEIGHT: float = 128.0

func _ready() -> void:
    var parent = get_parent()
    if parent is Player:
        player = parent
    else:
        assert(false, "c must be a child of Player")

func _process(delta: float) -> void:
    if player.global_position.y < -4:
        player.global_position.y += MAP_HEIGHT + 8
    elif player.global_position.y > MAP_HEIGHT + 4:
        player.global_position.y -= MAP_HEIGHT + 8 
    pass