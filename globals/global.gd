extends Node
@export var game_over_scene: PackedScene
@export var current_inventory: Inventory
@export var items: Dictionary[Mineral.ToolType, Array] = {
	Mineral.ToolType.SHIP: [],
	Mineral.ToolType.PICKAXE: [],
	Mineral.ToolType.AXE: []
}

func game_over() -> void:
    get_tree().change_scene_to_packed(game_over_scene)