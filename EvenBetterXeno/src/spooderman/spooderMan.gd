extends KinematicBody

var gravity := Vector3(0,-3,0)
var jumpVec := Vector3( 0, 80, 0)
var avgNormal : Vector3 = Vector3.ZERO
var MOUSE_SENS := 0.005
var speed := 50.0
var vel := Vector3.ZERO
var jumpNum := 0
var maxJumpAmt := 10
var extraVel := Vector3.ZERO
var theUpDir := Vector3.UP
var jumpVectors := Vector3.ZERO
var bodyOn : StaticBody
var mouseSensMulti := 1

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$checker.connect("body_entered",self,"bodyEntered")
func bodyEntered(body:PhysicsBody) -> void:
	if body and body != bodyOn and body is StaticBody:
		bodyOn = body
		jumpVectors = Vector3.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$head/Camera.rotation.x += -event.relative.y * MOUSE_SENS 
		$head.rotation.y += -event.relative.x * MOUSE_SENS * mouseSensMulti
	
	if abs($head/Camera.rotation_degrees.x) >= 360:
		$head/Camera.rotation_degrees.x = 0
	if abs($head.rotation_degrees.y) >= 360:
		$head.rotation_degrees.y = 0
	if abs($head/Camera.rotation_degrees.x) > 90:
		mouseSensMulti = -1
	else:
		mouseSensMulti = 1
func checkRays() -> void:
	var avgNor := Vector3.ZERO
	var numOfRaysColliding := 0
	for ray in $head/rayFolder.get_children():
		var r : RayCast = ray
		if r.is_colliding():
			numOfRaysColliding += 1
			avgNor += r.get_collision_normal()
	if avgNor:
		avgNor /= numOfRaysColliding
		avgNormal = avgNor.normalized()
		jumpVec = avgNormal * 50
		gravity = avgNormal * -3
	else: # come back and showcase this
		avgNormal = Vector3.UP
		jumpVec = avgNormal * 50
		gravity = avgNormal * -3

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("shift"):
		speed = 10.0
	if Input.is_action_just_released("shift"):
		speed = 50.0

func jump() -> void:
	jumpVectors += jumpVec
	avgNormal = Vector3.UP
	jumpVec = avgNormal * 50
	gravity = avgNormal * -3

func _physics_process(delta: float) -> void:
	vel = speed * get_dir()
	checkRays()
	if not is_on_floor():
		jumpVectors += gravity
#		avgNormal = Vector3.UP
	elif is_on_floor():
		jumpVectors = Vector3.ZERO
	if Input.is_action_just_pressed("space"):
		jump() 
	vel += jumpVectors
	vel = move_and_slide(vel, avgNormal.normalized())

func get_dir() -> Vector3:
	var dir : Vector3 = Vector3.ZERO
	var fowardDir : Vector3 = ( $head/Camera/Position3D.global_transform.origin - $head.global_transform.origin  ).normalized()
	var dirBase :Vector3= avgNormal.cross( fowardDir ).normalized()
	if Input.is_action_pressed("ui_up"):
		dir = dirBase.rotated( avgNormal.normalized(), -PI/2 )
	if Input.is_action_pressed("ui_down"):
		dir = dirBase.rotated( avgNormal.normalized(), PI/2 )
	if Input.is_action_pressed("ui_left"):
		dir = dirBase
	if Input.is_action_pressed("ui_right"):
		dir = dirBase.rotated(avgNormal.normalized(), PI)
	return dir.normalized()











