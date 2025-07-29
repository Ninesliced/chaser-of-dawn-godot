extends Resource

class_name Minerals
signal on_minerals_changed

@export var wood: int
@export var coal: int
@export var stone: int
@export var copper: int
@export var amethyst: int

func add(minerals: Minerals):
	on_minerals_changed.emit()
	wood += minerals.wood
	coal += minerals.coal
	stone += minerals.stone
	copper += minerals.copper
	amethyst += minerals.amethyst

func subtract(minerals: Minerals):
	on_minerals_changed.emit()
	wood -= minerals.wood
	coal -= minerals.coal
	stone -= minerals.stone
	copper -= minerals.copper
	amethyst -= minerals.amethyst
