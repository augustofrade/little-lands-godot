extends RigidBody2D

@onready var harvestStatus: HarvestableComponent = $HarvestableComponent
@onready var healthStatus: HealthComponent = $HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _onRegrowth():
	print("finished")



func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("action"):
		if(harvestStatus.isHarvestable()):
			harvestStatus.reset()
		#shake tree
