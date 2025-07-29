extends Node2D
@export var default_inventory: Inventory

func _ready() -> void:
    Global.current_inventory = default_inventory.duplicate(true)