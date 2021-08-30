extends Node2D

func _ready() -> void:
	for i in randi() % 100:
		var thing :Node2D= preload("res://src/thing.tscn").instance()
		add_child(thing)
		thing.global_position = Vector2( rand_range(0,1024), rand_range( 0,600 )  )  
