extends Node2D


func _ready() -> void:
	$main_player.connect("playerWantsToRemoveAllEnemies", self,"playerWantsToRemoveAllEnemies")
	$Timer.connect("timeout",self,"spawnEnemyMethod")

func playerWantsToRemoveAllEnemies() -> void:
	for child in $EnemyFolder.get_children():
		if child.has_method("die"):
			child.die()


func spawnEnemyMethod() -> void:
	randomize()
	var enemy := preload("res://src/enemy_question_mark/enemy.tscn").instance()
	$EnemyFolder.add_child(enemy)
	enemy.global_position = Vector2(rand_range(0,1000), rand_range(0,700))
	pass
