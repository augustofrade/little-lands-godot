extends Node
class_name ActionComponent

signal onActionStart
signal onActionEnd

@export var interactionDelay: float = 1.0

@export var isInteracting = false

func _ready():
	$Timer.wait_time = interactionDelay


func _process(delta):
	if Input.is_action_pressed("action") && !isInteracting:
		isInteracting = true
		onActionStart.emit()
		$Timer.start()


func _on_timer_timeout():
	isInteracting = false
	onActionEnd.emit()
