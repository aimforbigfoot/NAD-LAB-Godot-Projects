extends RigidBody2D

var dir := Vector2.ZERO

func _physics_process(_delta: float) -> void:
	linear_velocity = dir
	dir = lerp(dir, Vector2.ZERO, 0.03)
