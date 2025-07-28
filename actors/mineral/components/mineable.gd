extends Node

var ore: MineralOre
var mineral: Mineral

var can_mine: bool = false
var mining_timer: float = 0.0

func _ready() -> void:
	var parent = get_parent()
	if parent is MineralOre:
		mineral = parent.data
		ore = parent
	else:
		assert(false, "MineableComponent must be a child of MineralOre")

func _physics_process(delta: float) -> void:
	if not (Input.is_action_pressed("c") and can_mine):
		mining_timer = 0.0
		return
	
	var inventory: Inventory = Global.current_inventory
	var mining_time: float = mineral.levels[inventory.get_tool_level(mineral.tool)]
	if mining_time <= 0:
		return
	
	mining_timer += delta
	if mining_timer >= mining_time:
		mining_timer = 0.0
		inventory.minerals.add(mineral.drops)

func _on_area_2d_area_entered(area: Area2D) -> void:
	self.can_mine = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	self.can_mine = false
