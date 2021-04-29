extends KinematicBody2D

const orginalSpeed := 300.0
var screensize : Vector2
var speed := orginalSpeed

func _ready() -> void:
	screensize = get_viewport_rect().size
	global_position = screensize/2


func _physics_process(_delta: float) -> void:
	var vel := get_dir() * speed
	vel = move_and_slide(vel)

func get_dir() -> Vector2:
	var vec : Vector2
	vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return vec


func die() -> void:
	get_tree().reload_current_scene()
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ctrl"):
		speed = 100.0
	elif event.is_action_released("ctrl"):
		speed = orginalSpeed
	if event.is_action_pressed("shift"):
		speed = 600.0
	elif event.is_action_released("shift"):
		speed = orginalSpeed
		
