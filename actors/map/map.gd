extends Node2D

func _ready() -> void:
	print("H")
	print($TileMapLayer.get_tile_map_data_as_array())
	print("V")
