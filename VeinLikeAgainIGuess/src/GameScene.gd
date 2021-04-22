extends TileMap

export var width := 128
export var height := 75
export var minRoomSize := 3
export var maxRoomSize := 10
enum TILE {BLACK, WHITE, GREEN, YELLOW}

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("o"):
		random_white_room_on_green_square()
	if Input.is_action_just_pressed("g"):
		random_white_room_on_green_square()
		long_random_green_line_on_white_square()
	if Input.is_action_just_pressed("p"):
			for x in width:
				for y in height:
					if get_cell(x,y) == TILE.GREEN:
						set_cell(x,y, TILE.WHITE)
func _ready() -> void:
	randomize()
	black_back()
	random_green_square()
	for i in 7:
		random_white_room_on_green_square()
		long_random_green_line_on_white_square()


func black_back() -> void:
	for x in width:
		for y in height:
			set_cell(x,y, TILE.BLACK)


func random_green_square() -> void:
	var mar := 15
	for i in 5:
		var randX := rand_range(mar, width-mar)
		var randY := rand_range(mar, height-mar)
		set_cell(randX,randY, TILE.GREEN)


func random_white_room_on_green_square() -> void:
	var mar := 15
	for x in range(mar, width-mar):
		for y in range (mar, height-mar):
			if get_cell(x,y) == TILE.GREEN:
				var randX := rand_range(minRoomSize, maxRoomSize)
				var randY := rand_range(minRoomSize, maxRoomSize)
				for i in range ( x-randX, x+randX  ):
					for j in range (  y-randX, y+randY  ):
						set_cell(i,j, TILE.WHITE)

func nearbyCellIsSmth(x:int,y:int,tileType:int) -> int:
	var ret : int = 0
	ret += 1 if get_cell(x-1,y-1) == tileType else 0
	ret += 1 if get_cell(x,y-1) == tileType else 0
	ret += 1 if get_cell(x+1,y-1) == tileType else 0
	ret += 1 if get_cell(x-1,y) == tileType else 0
	ret += 1 if get_cell(x+1,y) == tileType else 0
	ret += 1 if get_cell(x-1,y+1) == tileType else 0
	ret += 1 if get_cell(x,y+1) == tileType else 0
	ret += 1 if get_cell(x+1,y+1) == tileType else 0
	return ret


func long_random_green_line_on_white_square() -> void:
	var mar := 15
	for x in range(mar, width-mar):
		for y in range (mar, height-mar):
			if get_cell(x,y) == TILE.WHITE and nearbyCellIsSmth(x,y,TILE.BLACK) and randf() < 0.05:
				var randNum := randf()
				if randNum < 0.25:
					for i in floor(rand_range(5,20)):
						set_cell(x+i,y,TILE.GREEN)
				elif randNum < 0.5:
					for i in floor(rand_range(5,20)):
						set_cell(x,y-i,TILE.GREEN)
				elif randNum < 0.75:
					for i in floor(rand_range(5,20)):
						set_cell(x,y+i,TILE.GREEN)
				else:
					for i in floor(rand_range(5,20)):
						set_cell(x-i,y,TILE.GREEN)





