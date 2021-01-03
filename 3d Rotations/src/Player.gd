extends KinematicBody

export var mouseSense := 0.005
export var speed := 40.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$MeshInstance.rotate_x( event.relative.y * mouseSense )
		rotate_y( -event.relative.x * mouseSense )
		print(event.relative)


func _physics_process(delta: float) -> void:
#	$MeshInstance.rotation_degrees.x = clamp($MeshInstance.rotation_degrees.x, -80,80 )
	var dir := Vector3.ZERO
#	print($MeshInstance.transform.basisy)
	if Input.is_action_pressed("ui_up"):
		dir += transform.basis.z
		dir.y -= $MeshInstance.transform.basis.y.z
	if Input.is_action_pressed("ui_down"):
		dir -= transform.basis.z
		dir.y += $MeshInstance.transform.basis.y.z
	if Input.is_action_pressed("ui_left"):
		dir += transform.basis.x
	if Input.is_action_pressed("ui_right"):
		dir -= transform.basis.x
	
	dir = dir.normalized() * speed
	
	move_and_slide(dir, Vector3.UP)
