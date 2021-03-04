extends TileMap

export var width := 128
export var height := 75
export var fill_percent := 0.54
export var num_of_blocks_near := 4
export var max_num_of_blocks_nearby := 6
var BlackTile = 1

func _ready() -> void:
	randomize()
	random_fill()
#	make_caves()
	make_walls()


func random_fill() -> void:
	for x in width:
		for y in height:
			if randf() > fill_percent : 
				set_cell(x,y,0)
			else:
				set_cell(x,y,1)




func make_walls() -> void:
	for x in width:
		set_cell(x,0,1)
		set_cell(x,height-1,1)
	for y in height:
		set_cell(0,y,1)
		set_cell(width-1,y,1)




func make_caves() -> void:
	for x in range (2,width-2):
		for y in range(2,height-2):
			var count := 0
			if get_cell(x-1,y-1) == BlackTile: count += 1
			if get_cell(x,y-1) == BlackTile: count += 1
			if get_cell(x+1,y-1) == BlackTile: count += 1
			if get_cell(x-1,y) == BlackTile: count += 1
			if get_cell(x+1,y) == BlackTile: count += 1
			if get_cell(x-1,y+1) == BlackTile: count += 1
			if get_cell(x,y+1) == BlackTile: count += 1
			if get_cell(x+1,y+1) == BlackTile: count += 1
			if count < num_of_blocks_near:
				set_cell(x,y,0)
			if count >= max_num_of_blocks_nearby:
				set_cell(x,y,1)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_end"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("ui_home"):
		make_caves()
