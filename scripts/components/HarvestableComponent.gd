extends Node
class_name HarvestableComponent

signal canHarvestNode

@onready var _timer = $Timer

@export_category("Animation Setup")
@export var animationSprite: AnimatedSprite2D

@export_category("Entity Setup")
@export var initialAge: int = 0
@export var growthTotalTime: float


var _growthStepTime: float
var _animationLength: int

func _ready():
	startGrowth()
	
func reset() -> void:
	initialAge = 0
	animationSprite.frame = 0
	startGrowth()

func startGrowth() -> void:
	print("growing...")
	_animationLength = animationSprite.sprite_frames.get_frame_count("default")
	if(initialAge == -1):
		initialAge = _animationLength
	else:
		initialAge = clamp(initialAge, 0, _animationLength)
		_timer.wait_time = growthTotalTime / (_animationLength - 1)
		_timer.start()
	animationSprite.frame = initialAge

func isHarvestable() -> bool:
	return animationSprite.frame == _animationLength - 1

func _onTimerTick():
	animationSprite.frame += 1
	if(isHarvestable()):
		canHarvestNode.emit()
		_timer.stop()
		
