extends Node2D

onready var score_label := $score_label
onready var timer:= $enemy_makeer_timer
export var margin := 250
var score := 0

#How to make random enemies appear on the left and right of the player
func _on_enemy_makeer_timer_timeout() -> void:
	randomize()
	var area_rand := rand_range(-margin, (-margin-100))
	var rand_vec := Vector2(area_rand, area_rand)
	
	var area_enemy := preload("res://src/enemy/area2D_enemy.tscn").instance()
	area_enemy.global_position = $Player.global_position + rand_vec
	$enemy_folder.add_child(area_enemy)
	
	randomize()
	var rigid_rand := rand_range(margin, (margin+100))
	var rand_vec_rigid := Vector2(-rigid_rand,rigid_rand)
	
	var rigid_body_2d_enemy := preload("res://src/enemy/rigid_body_enemy.tscn").instance()
	rigid_body_2d_enemy.global_position = $Player.global_position + rand_vec_rigid
	$enemy_folder.add_child(rigid_body_2d_enemy)
	
	timer.start(rand_range(1,5))

func _process(delta: float) -> void:
	var player_global_ps : Vector2 = ($Player.global_position) + Vector2(-25, -100) 
	score_label.set_global_position(player_global_ps)
	score_label.text = ("Score:" + str(score))
	pass
