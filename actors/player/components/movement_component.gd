extends Node

var player: Player

@export var can_move: bool = true
signal on_vector

func _ready() -> void:
	var parent = get_parent()
	if parent is Player:
		player = parent
	else:
		assert(false, "MovementComponent must be a child of Player")

func _physics_process(delta: float) -> void:
	if not can_move:
		return
	var vector : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	on_vector.emit(vector)
	if UIManager.is_ui_open():
		vector = Vector2.ZERO
	player.velocity = vector.normalized() * player.speed
	player.move_and_slide()


func _on_die_component_on_die() -> void:
	can_move = false
	pass # Replace with function body.
