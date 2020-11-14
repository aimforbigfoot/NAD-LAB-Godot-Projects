extends RigidBody2D

var screensize : Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if get_global_mouse_position().x > ( (screensize.x)/2 ):
			fire_event(true) # right
		else:
			fire_event(false) # left


func fire_event(b:bool) -> void:
	if b: #right
		apply_central_impulse(Vector2(100,0))
	else: #left
		apply_central_impulse(Vector2(-100,0))
	pass
