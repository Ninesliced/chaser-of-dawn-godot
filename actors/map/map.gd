extends Node2D

@export var MAP_SIZE_X: int = 16
@export var MAP_SIZE_Y: int = 128

# var loaded_mineral = preload("res://actors/mineral/mineral.tscn")

"""
func _ready() -> void:
	var MineralMap: TileMapLayer = %MineralMap
	for x in range(MAP_SIZE_X):
		for y in range(MAP_SIZE_Y):
			var tileData = MineralMap.get_cell_tile_data(Vector2i(x,y))
			if !tileData:
				continue
			var mineralName: String = tileData.get_custom_data("Mineral")
			if !mineralName:
				continue
			var minerals: Minerals = Minerals.mineralList[mineralName]
			if !minerals:
				continue
			var mineral = loaded_mineral.instantiate()
				
				
			
A mettre dans minerals.gd
var mineralList = {
	 "Wood": preload("res://resources/minerals/wood.tres"),
	 "Stone": preload("res://resources/minerals/stone.tres"),
	 "Copper": preload("res://resources/minerals/copper.tres"),
	 "Coal": preload("res://resources/minerals/coal.tres"),
	 "Amethyst": preload("res://resources/minerals/amethyst.tres"),
}
"""
