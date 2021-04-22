extends Node2D

var map : TileMap 
enum tile {BLACK, WHITE}
var type_of_mover := ""
var mover_types := ["left","right","up","down"]
var choices := []
var tileSize := 8

func _ready() -> void:
	type_of_mover = mover_types[ floor(randf() * mover_types.size()) ]
	choices.append("type_of_mover")
	for type in mover_types:
		if type != type_of_mover:
			choices.append(type)
	map = get_parent()
	map.set_cell( map.world_to_map(global_position).x,map.world_to_map(global_position).y, tile.WHITE)



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move"):
		move_creature()
	if Input.is_action_just_pressed("moveAlot"):
		for i in 30:
			move_creature()


func move_creature() -> void:
	var x :float= map.world_to_map(global_position).x
	var y :float= map.world_to_map(global_position).y
	map.set_cell( x,y, tile.WHITE)
	
	map.set_cell( map.world_to_map(global_position).x,map.world_to_map(global_position).y, tile.WHITE)
	map.set_cell( map.world_to_map(global_position).x+1,map.world_to_map(global_position).y, tile.WHITE)
	map.set_cell( map.world_to_map(global_position).x-1,map.world_to_map(global_position).y, tile.WHITE)
	map.set_cell( map.world_to_map(global_position).x,map.world_to_map(global_position).y+1, tile.WHITE)
	var randVar := randf()
	if randVar < 0.5:
		determine_move(choices[0])
	elif randVar <= 0.67:
		determine_move(choices[1])
	elif randVar < 0.75:
		determine_move(choices[2])
	else:
		determine_move(choices[3])
	if randf() <= 0.02:
		get_parent().make_copy(global_position)
	if randf() < 0.01:
		queue_free()

#var mover_types := ["left","right","up","down"]
func determine_move(moveDir:String) -> void:
#	match moveDir:
#		"left":
#			global_position += Vector2(-tileSize,0)
#		"right":
#			global_position += Vector2(tileSize,0)
#		"up":
#			global_position += Vector2(0,-tileSize)
#		"down":
#			global_position += Vector2(0,tileSize)

	if moveDir == "left":
			global_position += Vector2(-tileSize,0)
	elif moveDir == "right":
			global_position += Vector2(tileSize,0)
	elif moveDir == "up":
			global_position += Vector2(0,-tileSize)
	elif moveDir == "down":
			global_position += Vector2(0,tileSize)







