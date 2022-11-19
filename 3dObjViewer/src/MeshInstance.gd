extends Spatial

var pressed := false
var rightPressed := false
var scaleMod := 0.05
var moveSpeed := 0.1

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_up"):
		$MeshInstance.scale += Vector3.ONE*scaleMod
	if event.is_action_pressed("mouse_down"):
		$MeshInstance.scale -= Vector3.ONE*scaleMod
	
	if rightPressed and event is InputEventMouseMotion:
		global_transform.origin += Vector3(event.relative.x, -event.relative.y, 0)*moveSpeed
	
	if pressed and event is InputEventMouseMotion:
		rotation.x += event.relative.y*0.005
		$MeshInstance.rotation.y += event.relative.x*0.005



func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		rightPressed = true
	if Input.is_action_just_released("right_click"):
		rightPressed = false

	if Input.is_action_just_pressed("click"):
		pressed = true
	if Input.is_action_just_released("click"):
		pressed = false
