extends KinematicBody

const GRAVITY := -4.8
var jump_speed := 50
var speed := 50.0
var ydir := 0.0


func _physics_process(delta: float) -> void:
	var dir := Vector3.ZERO
	dir.z = Input.get_action_strength("backwards") - Input.get_action_strength("fowards")
	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir = dir.normalized() * speed
	
	if not is_on_floor():
		ydir += GRAVITY
	if Input.is_action_just_pressed("jump"):
		ydir = jump_speed
	dir.y = ydir
	dir = move_and_slide(dir, Vector3.UP)
