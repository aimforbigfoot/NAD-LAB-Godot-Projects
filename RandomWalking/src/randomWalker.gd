extends KinematicBody2D

onready var map :TileMap= get_parent().get_node("TileMap")
onready var timer := $Timer
export (float) var speed := 200000.0
var dir := Vector2.ZERO

func _ready() -> void:
	randomize()
	get_rand_dir()


func get_rand_dir()->void:
	dir = Vector2(get_rand_val(), get_rand_val()).normalized()

func get_rand_val() -> float:
	var fl := rand_range(-1,1)
	return fl


func _physics_process(delta: float) -> void:
	var vel := speed * dir * delta
	vel = move_and_slide(vel)
	var mPos :Vector2= map.world_to_map(global_position)
	map.set_cell(mPos.x, mPos.y, 0)


func _on_Timer_timeout() -> void:
	get_rand_dir()
	timer.start(rand_range(0.1,0.2))



# Possible Extensions
#
#Gravity Walkers (Add a gravity field to each)
#Don't walk where you walked before walkers
#OpenSimplexNoiseWalker
#Perlin Noise Walker 
#Trig functions walker
#Mouse Following Walker
#Drunken Walker (Add a random value to your direction, but make sure the walker is still going towards a point)
#So much more...

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
