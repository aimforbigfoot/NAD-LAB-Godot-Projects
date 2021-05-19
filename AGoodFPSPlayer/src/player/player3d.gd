extends KinematicBody

var MOUSE_SENS := 0.005
var gravity := -3
var speed := 30.0
var angForCamToLearpTo := 0.0
var XangForCamToLearpTo := 0.0
var vel := Vector3.ZERO
var ySpeed := 0.0
var jumpStrength := 50
var jumpNum := 0
var maxJumpAmt := 3

var dashNum := 0
var maxDashAmt := 3
var extraVelMulti := 400
var extraVel := Vector3.ZERO

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$head.rotation.x += -event.relative.y * MOUSE_SENS
		rotation.y += -event.relative.x * MOUSE_SENS

func jump() -> void:
	jumpNum += 1
	ySpeed = jumpStrength

func dashFoward() -> void:
	dashNum += 1
	if sign(ySpeed) == -1:
		ySpeed = 0
	extraVel += ($head/Camera/Sprite3D.global_transform.origin - $head/Camera.global_transform.origin).normalized()*extraVelMulti

func _physics_process(delta: float) -> void:
	vel = get_dir().rotated( Vector3.UP, rotation.y) * speed
	if not is_on_floor() :
		ySpeed += gravity
	else:
		ySpeed = 0.0
		dashNum = 0
		jumpNum = 0
	if Input.is_action_just_pressed("space") and (jumpNum < maxJumpAmt):
		jump()
	if Input.is_action_just_pressed("f") and (dashNum < maxDashAmt):
		dashFoward()
	$head.rotation_degrees.z = lerp($head.rotation_degrees.z, angForCamToLearpTo, 0.1)
	$head/Camera.rotation_degrees.x = lerp($head/Camera.rotation_degrees.x, XangForCamToLearpTo, 0.1)
	extraVel = lerp( extraVel, Vector3.ZERO, 0.1 )
	vel.y = ySpeed
	vel += extraVel
	vel = move_and_slide(vel, Vector3.UP)


func get_dir() -> Vector3:
	var dir : Vector3
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	angForCamToLearpTo = dir.x*-2.5
	XangForCamToLearpTo = dir.z*7.5
	print(angForCamToLearpTo," ", XangForCamToLearpTo)
	return dir.normalized()













