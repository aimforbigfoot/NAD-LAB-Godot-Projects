extends KinematicBody

#onready var bottomray := $head/rayFolder/bottomRay
#onready var fowardray := $head/rayFolder/fowardRay
#onready var backray := $head/rayFolder/backRay
#onready var rightray := $head/rayFolder/rightRay
#onready var leftray := $head/rayFolder/leftRay
#onready var upray := $head/rayFolder/upRay
onready var bottomray := $rayFolder/bottomRay
onready var fowardray := $rayFolder/fowardRay
onready var backray := $rayFolder/backRay
onready var rightray := $rayFolder/rightRay
onready var leftray := $rayFolder/leftRay
onready var upray := $rayFolder/upRay


var gravity := Vector3(0,-3,0)
var jumpVec := Vector3( 0, 80, 0)
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

var maxAxisNum := 0


THIS ONE DOES NOT WORK


var bodyOn : StaticBody

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	$checkerArea.connect("body_entered",self,"bodyEntered")
#	$checkerArea.connect("body_exited",self,"bodyExited")
#func bodyEntered(_body) -> void:
#	jumpVectors = Vector3.ZERO
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()


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
			
			

func jump() -> void:
	jumpVectors += jumpVec
	jumpNum += 1
	jumpVec = Vector3.UP
	avgNormal = Vector3.UP
	gravity = -avgNormal.normalized() * 4
	jumpVec = avgNormal.normalized() * 100
	theUpDir = avgNormal.normalized()
	
func _physics_process(delta: float) -> void:
	vel = get_dir() * speed
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
	avgNormal /= $rayFolder.get_child_count()
	$head.rotation.x = lerp_angle( $head.rotation.x,  (avgNormal.angle_to(Vector3.UP )), 0.2 )

	$box.rotation = $head.rotation
#		print("you are on a flat surface")
		
	print( (avgNormal.angle_to(Vector3.UP ))  )
	print( avgNormal.angle_to(Vector3.UP)   )
#	print(avgNormal.angle_to(Vector3.UP ))
	if avgNormal:
		avgNormal = avgNormal.normalized()
		gravity = - avgNormal* 4
		jumpVec = avgNormal * 100
		theUpDir = avgNormal
	
	
func get_dir() -> Vector3:
	var dir : Vector3
	if Input.is_action_pressed("ui_up"):
		dir += ( $box/foward.global_transform.origin - global_transform.origin )
	if Input.is_action_pressed("ui_down"):
		dir += ( $box/back.global_transform.origin - global_transform.origin )
	if Input.is_action_pressed("ui_right"):
		dir += ( $box/right.global_transform.origin - global_transform.origin )
	if Input.is_action_pressed("ui_left"):
		dir += ( $box/left.global_transform.origin - global_transform.origin )
#	dir.x = ( ( Input.get_action_strength("ui_right")  ) - Input.get_action_strength("ui_left") )   * rotSensMulti
#	dir.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") )   * rotSensMulti
#	dir.z = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * rotSensMulti
#	dir.z = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * rotSensMulti
	angForCamToLearpTo = dir.x*-2.5
	XangForCamToLearpTo = dir.z*7.5
#	print(s$head/Camera.rotation_degrees, " ", $head.rotation_degrees)
#	dir = dir.rotated(  )
#	if avgNormal and dir:
#		var ang = dir.angle_to( avgNormal )
#		print(dir, " ",  ang-PI/2, " ", avgNormal)
#		dir = dir.rotated( dir.cross( avgNormal).normalized(), ang-PI/2 )
	
	return dir.normalized()




