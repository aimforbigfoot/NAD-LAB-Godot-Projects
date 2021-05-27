extends KinematicBody

var gravity := Vector3(0,-3,0)
var jumpVec := Vector3( 0, 80, 0)
var rotNormal = Vector3.ZERO
var avgNormal : Vector3 = Vector3.ZERO
var MOUSE_SENS := 0.005
var speed := 50.0
var angForCamToLearpTo := 0.0
var XangForCamToLearpTo := 0.0
var vel := Vector3.ZERO
var ySpeed := 0.0
var jumpNum := 0
var maxJumpAmt := 10
var extraVel := Vector3.ZERO
var theUpDir := Vector3.UP
var jumpVectors := Vector3.ZERO
var mouseSensMulti := 1.0
var rotSensMulti := 1.0
var bodyOn : StaticBody

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()

THIS ONE DOES NOT WORK

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$head/Camera.rotation.x += -event.relative.y * MOUSE_SENS 
		$head.rotation.y += -event.relative.x * MOUSE_SENS * mouseSensMulti
		if abs($head/Camera.rotation_degrees.x) >= 360:
			$head/Camera.rotation_degrees.x = 0
		if abs($head.rotation_degrees.y) >= 360:
			$head.rotation_degrees.y = 0

func jump() -> void:
	jumpVectors += jumpVec
	jumpNum += 1
	jumpVec = Vector3.UP
	avgNormal = Vector3.UP
	gravity = -avgNormal * 4
	jumpVec = avgNormal * 100
	theUpDir = avgNormal
	rotNormal = Vector3.FORWARD
	
func _physics_process(delta: float) -> void:
	vel = speed * get_dir().rotated( avgNormal.normalized(), $head.rotation.y )
#	print($head.rotation.y)
	if not is_on_floor():
		jumpVectors += gravity
		avgNormal = Vector3.UP
	else:
		jumpVectors = Vector3.ZERO
	if Input.is_action_just_pressed("space"):
		jump() 
	checkRays()
	vel += jumpVectors
	vel = move_and_slide(vel, theUpDir)


func checkRays() -> void:
	avgNormal = Vector3.ZERO
	var gotCol := false
	for ray in $rayFolder.get_children():
		var r : RayCast = ray
		if r.is_colliding():
			gotCol = true 
			avgNormal += r.get_collision_normal()
	if not gotCol:
		jumpVec = Vector3.UP
		avgNormal = Vector3.UP
		gravity = -avgNormal.normalized() * 4
		jumpVec = avgNormal.normalized() * 100
		theUpDir = avgNormal.normalized()
		rotNormal = Vector3.FORWARD
	$head.rotation.x = lerp_angle( $head.rotation.x,  (avgNormal.angle_to(Vector3.UP )), 0.2 )

	if avgNormal:
		avgNormal /= $rayFolder.get_child_count()
		avgNormal = avgNormal.normalized()
		gravity = - avgNormal* 4
		jumpVec = avgNormal * 100
		theUpDir = avgNormal #                      x             y               z
		rotNormal = Vector3(avgNormal.z, avgNormal.z, -avgNormal.x - avgNormal.y  )


func get_dir() -> Vector3:
	var dir : Vector3
	print( rotNormal)
	if Input.is_action_pressed("ui_up"):
		dir = -avgNormal.cross(  rotNormal  ).rotated( avgNormal , PI/2  )
#		dir = dir
		print(dir)
#		ijk   Vector3( j-k, k-i, -i-j   ) 
#		xyz   Vector3( y-z, z-x, -x-y  ) 
#		dir += -avgNormal.rotated( avgNormal.cross( Vector3.FORWARD ).normalized(), -PI/2   )
	if Input.is_action_pressed("ui_right"):
		dir += avgNormal.rotated(  Vector3.FORWARD  , PI/2 )

	return dir.normalized()



