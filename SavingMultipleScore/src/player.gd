extends KinematicBody2D

export var speed := 700.0

func _ready() -> void:
	var i_want_to_load_val := true
	if SaveScript.is_file_there() and i_want_to_load_val:
		global_position = SaveScript.load_val()[1]


func _physics_process(delta: float) -> void:
	var vel := speed * dir()
	vel = move_and_slide(vel)


func dir() -> Vector2:
	var _dir := Vector2.ZERO
	_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return _dir


func _on_player_tree_exiting() -> void:
	SaveScript.things_to_save[1] =(global_position)
	SaveScript.save_val()
	print("player exited")
