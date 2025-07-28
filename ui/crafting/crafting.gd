extends Control
class_name CraftingUI

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("x") and !visible:
		print("craft ui")
		UIManager.first_unclosable = false
		UIManager.set_ui(self)
		UIManager.consume_input()
