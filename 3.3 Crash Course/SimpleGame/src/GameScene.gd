extends Node2D

func _ready() -> void:
	$enemySpawnTimer.start()


func _on_enemySpawnTimer_timeout() -> void:
	for i in 10:
		spawn_enemy()

		
		
		
	$enemySpawnTimer.wait_time = rand_range(0,1)


func spawn_enemy() -> void:
	var enemy : Area2D = preload("res://src/enemy/enemy.tscn").instance()
	add_child(enemy)
#	enemy.dir = ($player.global_position - enemy.global_position).normalized()

