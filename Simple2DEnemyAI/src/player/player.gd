extends KinematicBody2D

var speed := 500.0


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	var vel := get_vel() * speed
	vel = move_and_slide(vel)


func get_vel() -> Vector2:
	var v := Vector2()
	v.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	v.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return v
