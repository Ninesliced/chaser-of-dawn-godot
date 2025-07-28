extends Node2D

func _process(delta: float) -> void:
	var current = Global.current_inventory.minerals
	
	if !current:
		return
	
	%WoodQuantity.text = current.wood
	%StoneQuantity.text = current.stone
	%CopperQuantity.text = current.copper
	%CoalQuantity.text = current.coal
	%AmethQuantity.text = current.amethyst
