extends Control

@onready var play: MainMenuButton = %Play
@onready var main: Control = %Main

func _ready() -> void:
    UIManager.first_unclosable = true
    UIManager.set_ui(main, play)
    pass