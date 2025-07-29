@tool
extends Control
class_name ResourceRequireUI

@onready var texture_rect: TextureRect = %TextureRect

@export_enum("wood", "stone", "copper", "coal", "amethyst") var mineral: String:
	set(value):
		mineral = value
		if !%TextureRect:
			return

		%TextureRect.texture.region = dict_texture_region[mineral]

@onready var label: Label = %Label

var dict_texture_region: Dictionary[String, Rect2] = {
	"wood": Rect2(0, 48, 8, 8),
	"stone": Rect2(8, 48, 8, 8),
	"copper": Rect2(16, 48, 8, 8),
	"coal": Rect2(24, 48, 8, 8),
	"amethyst": Rect2(32, 48, 8, 8)
}
var valid_color: Color = Color(0.0, 0.529, 0.318, 1.0)
var invalid_color: Color = Color(1.0, 0.0, 0.302, 1.0)
var _required : int = 5

func set_required(required: int) -> void:
	_required = required
	label.text = str(_required)
	on_inventory_changed()
#FIXME: SCOTCH
func get_current_mineral_number() -> int:
	print(mineral)
	# return Global.current_inventory.minerals[mineral]*
	match mineral:
		"wood":
			return Global.current_inventory.minerals.wood
		"coal":
			return Global.current_inventory.minerals.coal
		"stone":
			return Global.current_inventory.minerals.stone
		"copper":
			return Global.current_inventory.minerals.copper
		"amethyst":
			return Global.current_inventory.minerals.amethyst
	return 0

func on_inventory_changed() -> void:
	if get_current_mineral_number() >= _required:
		label.self_modulate = valid_color
	else:
		label.self_modulate = invalid_color

func _ready() -> void:
	label.text = "0"
	Global.current_inventory.minerals.on_minerals_changed.connect(on_inventory_changed)
	on_inventory_changed()
