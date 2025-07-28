extends Control

@onready var play: MainMenuButton = %Play

func _ready() -> void:
    play.grab_focus()
    pass