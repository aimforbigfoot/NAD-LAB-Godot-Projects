extends Node2D

export var num := 100
export var margin := 100
var screensize : Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size
	randomize()
	for i in num:
		spawnBoid()


func _on_Timer_timeout() -> void:
	var c := $boidFolder.get_child_count() 
	if c < num:
		print("too few fish :(")
		for i in floor(num - c):
			spawnBoid()


func spawnBoid() -> void:
	var boid : Area2D = preload("res://src/boid.tscn").instance()
	$boidFolder.add_child(boid)
	boid.modulate = Color(randf(), randf(), randf(), 1)
	boid.global_position = Vector2(  (rand_range(margin, screensize.x - margin)), (rand_range(margin, screensize.y - margin)) )
