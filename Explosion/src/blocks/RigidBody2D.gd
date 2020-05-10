extends RigidBody2D

var force_var : Vector2 = Vector2.ZERO

func push() -> void:
	apply_central_impulse(force_var * 2)
	pass
