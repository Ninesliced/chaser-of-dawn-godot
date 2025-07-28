extends Node

@export var current_inventory: Inventory
@export var items: Dictionary[Mineral.ToolType, Array] = {
    Mineral.ToolType.SHIP: [],
    Mineral.ToolType.PICKAXE: [],
    Mineral.ToolType.AXE: []
}