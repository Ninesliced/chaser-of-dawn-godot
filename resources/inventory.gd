extends Resource

class_name Inventory


@export var pickaxe: Mineral.ToolMaterial
@export var axe: Mineral.ToolMaterial
@export var ship: Mineral.ToolMaterial

@export var minerals: Minerals

func get_tool_level(tool: Mineral.ToolType) -> int:
	match tool:
		Mineral.ToolType.PICKAXE:
			return pickaxe
		Mineral.ToolType.AXE:
			return axe
		Mineral.ToolType.SHIP:
			return ship
	return 0
