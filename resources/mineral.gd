extends Resource

class_name Mineral

enum ToolType {
	SHIP,
	PICKAXE,
	AXE
}

enum ToolMaterial {
	WOOD,
	STONE,
	COPPER,
	AMETHYST
}

@export var name: String
@export var sprite: Texture2D
@export var tool: ToolType
@export var levels: Dictionary[ToolMaterial, int] # {Tool Level, Mining Time}

@export var drops: Minerals
