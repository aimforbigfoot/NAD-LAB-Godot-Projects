extends KinematicBody

signal gunChanged 

export var speed := 10.0
const gravity := -7.5
var MOUSE_SENSITIVITY = 0.2
var ySpeed := 0.0
var vel : Vector3

onready var head := $head



func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	animPlayer.play("moving")

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY*-1))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))
		var camera_rot = head.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -90, 90)
		head.rotation_degrees = camera_rot
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	
func _physics_process(_delta: float) -> void:
	
			
	vel = speed * get_dir().rotated(Vector3.UP,rotation.y)

	vel = move_and_slide(vel, Vector3.UP)
	if !vel.is_equal_approx(Vector3.ZERO):
#		considered moving
		pass
	else:
#		not moving
		pass

func get_dir() -> Vector3:
	var dir : Vector3 = Vector3.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
#	animPlayer.play("moving")
	return dir 


