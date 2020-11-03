extends RigidBody2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		fire_event()

func fire_event() -> void:
	apply_central_impulse(Vector2(2500,0).rotated(rotation))
