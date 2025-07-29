@tool
extends Control
class_name UpgradeUI

@export var current_tool: Mineral.ToolType = Mineral.ToolType.PICKAXE:
	set(value):
		current_tool = value
		set_current_texture()

@export var ui_dict : Dictionary[Mineral, ResourceRequireUI]
@export var hide_amethyst_coal: bool = false:
	set(value):
		hide_amethyst_coal = value
		if hide_amethyst_coal:
			%coal.hide()
			%amethyst.hide()
		else:
			%coal.show()
			%amethyst.show()
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

func set_current_tool(tool: Mineral.ToolMaterial) -> void:
	match current_tool:
		Mineral.ToolType.PICKAXE:
			Global.current_inventory.pickaxe = tool
		Mineral.ToolType.AXE:
			Global.current_inventory.axe = tool
		Mineral.ToolType.SHIP:
			Global.current_inventory.ship = tool
	on_upgrade()

func set_current_texture() -> void:
	if !current:
		return
	if !new:
		return
	var item_upgrade: ItemUpgrade = Global.item_upgrades[current_tool][get_current_tool()]
	current.texture = item_upgrade.texture
	var next_tool_index: int = min(get_current_tool() + 1, Global.item_sprites[current_tool].size() - 1)

	var next_item_upgrade: ItemUpgrade = Global.item_upgrades[current_tool][next_tool_index]
	new.texture = next_item_upgrade.texture

func apply_next_required(index: int) -> void:
	var item_upgrade = Global.item_upgrades[current_tool][index]
	for mineral in ui_dict:
		if mineral not in item_upgrade.cost:
			print("WARNING: Mineral ", mineral, " not found in item upgrade costs for ", current_tool)
			ui_dict[mineral].set_required(0)
			continue

		var cost = item_upgrade.cost[mineral]
		ui_dict[mineral].set_required(cost)


func on_upgrade():
	set_current_texture()
	apply_next_required(get_current_tool())


func _ready() -> void:
	if hide_amethyst_coal:
		%coal.hide()
		%amethyst.hide()
	set_current_texture()
	apply_next_required(get_current_tool())
	pass

func is_enough_resources() -> bool:
	for mineral in ui_dict:
		if ui_dict[mineral].get_current_mineral_number() < ui_dict[mineral]._required:
			return false
	return true

func _on_crafting_button_pressed() -> void:
	if !is_enough_resources():
		return
	set_current_tool(min(Global.item_upgrades[current_tool].size() - 1, get_current_tool() + 1))
	pass # Replace with function body.
