extends Node
class_name HealthComponent

signal healthReachZero

@export_category("Health Setup")
@export var maxHealth: float = 100
@export var currentHealth: float = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hasHealthRemaining() -> bool:
	return is_equal_approx(currentHealth, 0.0)

func addHealth(value:float) -> void:
	updateHealth(value)

func removeHealth(value: float) -> void:
		updateHealth(-value)

func updateHealth(value: float) -> void:
	currentHealth += value
	if !hasHealthRemaining():
		get_parent().queue_free()
		healthReachZero.emit()
