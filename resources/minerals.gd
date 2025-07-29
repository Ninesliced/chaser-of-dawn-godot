extends Resource

class_name Minerals


@export var wood: int
@export var coal: int
@export var stone: int
@export var copper: int
@export var amethyst: int

func add(minerals: Minerals):
	wood += minerals.wood
	coal += minerals.coal
	stone += minerals.stone
	copper += minerals.copper
	amethyst += minerals.amethyst

func subtract(minerals: Minerals):
	wood -= minerals.wood
	coal -= minerals.coal
	stone -= minerals.stone
	copper -= minerals.copper
	amethyst -= minerals.amethyst
