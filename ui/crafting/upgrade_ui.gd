@tool
extends Control
class_name UpgradeUI

@export var current_tool: Mineral.ToolType = Mineral.ToolType.PICKAXE:
	set(value):
		current_tool = value
		# set_current_texture()

@onready var current: TextureRect = %Current
@onready var new: TextureRect = %New

func get_current_tool() -> Mineral.ToolMaterial:
	match current_tool:
		Mineral.ToolType.PICKAXE:
			return Global.current_inventory.pickaxe
		Mineral.ToolType.AXE:
			return Global.current_inventory.axe
		Mineral.ToolType.SHIP:
			return Global.current_inventory.ship
	return Mineral.ToolMaterial.WOOD

func set_current_texture() -> void:
	current.texture = Global.items[current_tool][get_current_tool()]

	var next_tool_index: int = min(get_current_tool() + 1, Global.items[current_tool].size() - 1)

	new.texture = Global.items[current_tool][next_tool_index]

func _ready() -> void:
	pass
