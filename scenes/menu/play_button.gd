extends MainMenuButton

@export var next_node_ui: Control

func _on_pressed() -> void:
	UIManager.set_ui(next_node_ui, next_node_ui, true)
	next_node_ui.grab_focus()
