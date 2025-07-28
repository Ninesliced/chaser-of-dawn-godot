extends Resource

enum ToolType {
	PICKAXE,
	AXE
}

@export var name: String
@export var sprite: Texture2D
@export var tool: ToolType
@export var levels: Dictionary
