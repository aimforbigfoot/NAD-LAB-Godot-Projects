extends TileMap

export var width := 240
export var height := 128
enum tile {BLACK, WHITE}

func _ready() -> void:
	randomize()
	make_everything_black()
	place_creature()

func make_everything_black() -> void:
	for x in width:
		for y in height:
			set_cell(x,y, tile.BLACK)


func place_creature() -> void:
	var margin := 15
	var screensize := get_viewport_rect().size
	for i in 3:
		var randX := screensize.x/2
		var randY := rand_range(screensize.y/2 - margin, screensize.y/2+margin )
		var creature := preload("res://src/Creature.tscn").instance()
		creature.global_position = Vector2(randX, randY)
		add_child(creature)


func make_copy(asdfsadfsdf : Vector2) -> void:
	var creature := preload("res://src/Creature.tscn").instance()
	creature.global_position = asdfsadfsdf
	add_child(creature)



func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("clean"):
		clean_map()
		pass
	if Input.is_action_just_pressed("purge"):
		for child in get_children():
			child.queue_free()

func clean_map() -> void:
	for x in range(1,width-1):
		for y in range(1,height-1):
			if get_cell(x,y) == tile.BLACK:
				var sum := 0
				sum += 1 if get_cell(x-1,y-1) == tile.WHITE else 0
				sum += 1 if get_cell(x,y-1) == tile.WHITE else 0
				sum += 1 if get_cell(x+1,y-1) == tile.WHITE else 0
				sum += 1 if get_cell(x-1,y) == tile.WHITE else 0
				sum += 1 if get_cell(x+1,y) == tile.WHITE else 0
				sum += 1 if get_cell(x-1,y+1) == tile.WHITE else 0
				sum += 1 if get_cell(x,y+1) == tile.WHITE else 0
				sum += 1 if get_cell(x+1,y+1) == tile.WHITE else 0
				if sum >= 6:
					set_cell(x,y, tile.WHITE)

