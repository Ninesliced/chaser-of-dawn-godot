extends Control
class_name CraftingUI

@export var focus_node : Node = null

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("x") and !visible:
		UIManager.first_unclosable = false
		UIManager.set_ui(self, focus_node, false)
		UIManager.consume_input()
