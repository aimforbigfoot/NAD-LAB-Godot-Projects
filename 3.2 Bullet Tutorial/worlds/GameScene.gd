extends Node2D


onready var bullet_folder := $bullet_folder

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var bullet := preload("res://bullet/bullet.tscn").instance()
		bullet.rotation = $player.deg_for_bullet
		bullet.global_position = $player/Position2D/Gun/Muzzle.global_position
		add_child(bullet)
		
