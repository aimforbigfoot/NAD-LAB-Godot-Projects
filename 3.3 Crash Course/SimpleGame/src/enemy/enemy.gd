extends Area2D

var dir : Vector2
var speed := 4

func _ready() -> void:
	var screensize := get_viewport_rect().size
	if randf() < 0.5:
#		top or bottom
		global_position.x = rand_range(0, screensize.x)
		if randf() < 0.5:
#			top
			global_position.y = 0
			dir = Vector2.DOWN
		else:
#			bottom
			global_position.y = screensize.y
			dir = Vector2.UP
	else:
		global_position.y = rand_range(0, screensize.x)
		if randf() < 0.5:
#			left
			dir = Vector2.RIGHT
			global_position.x = 0
			pass
		else:
			dir = Vector2.LEFT
#			right
			global_position.x = screensize.x
			pass
#		left and right
		pass



func _physics_process(delta: float) -> void:
	global_position += dir * speed


func _on_dieTimer_timeout() -> void:
	queue_free()


func _on_enemy_body_entered(body: Node) -> void:
	if body.is_in_group("player") :
		get_tree().reload_current_scene()
		pass
