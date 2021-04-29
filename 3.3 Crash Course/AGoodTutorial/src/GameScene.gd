extends Node2D

var screensize : Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size
	randomize()


func _on_OneSecondTimer_timeout() -> void:
	for i in 5:
		spawn_enemy()


func spawn_enemy() -> void:
	var randX : float
	var randY : float
	var dirOfEnemy := Vector2.ZERO
	if randf() < 0.5:
#		top or bottom
		if randf() < 0.5:
			dirOfEnemy = Vector2.UP
			randY = screensize.y
		else:
			dirOfEnemy = Vector2.DOWN
			randY = 0
		randX = rand_range(0,screensize.x)
		pass
	else:
#		left or right
		if randf() < 0.5:
			dirOfEnemy = Vector2.LEFT
			randX = screensize.x
		else:
			dirOfEnemy = Vector2.RIGHT
			randX = 0
		randY = rand_range(0,screensize.y)
	var enemy : Area2D = preload("res://src/enemy/enemy.tscn").instance()
	add_child(enemy)
	enemy.dir = dirOfEnemy
	enemy.global_position= Vector2(randX,randY)
