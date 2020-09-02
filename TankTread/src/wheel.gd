extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("flip"):
		if angular_velocity > 0:
			angular_velocity = (-100)
		else:
			angular_velocity = (100)
			
		print(angular_velocity)


func _on_Timer_timeout() -> void:
	angular_velocity= 100
