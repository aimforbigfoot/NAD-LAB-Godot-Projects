extends TileMap

var width := 256
var height := 150

func _ready() -> void:
	make_back_black()
	for i in 100:
		make_a_box()


func make_back_black() -> void:
	for x in width:
		for y in height:
			set_cell(x,y,0)



func make_a_box() -> void:
	var margin := 40
	var xOffest := rand_range(margin, width-margin)
	var yOffest := rand_range(margin, height-margin)
	
	var xRoom := rand_range(10,30)
	var yRoom := rand_range(10,30)
	for x in xRoom:
		for y in yRoom:
			set_cell(x+xOffest,y+yOffest,1)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("r"):
		get_tree().reload_current_scene()
