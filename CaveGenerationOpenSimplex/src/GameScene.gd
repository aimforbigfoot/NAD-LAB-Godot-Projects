extends Node2D

export var width := 128
export var height := 65
export var seed_in :String= ""
onready var tilemap := $TileMap
var osn := OpenSimplexNoise.new()


func _ready() -> void:
	randomize()
	if seed_in:
		osn.seed = hash(seed_in)
	else:
		osn.seed = randi()
	generate_map()


func generate_map() -> void:
	for x in width:
		for y in height:
			tilemap.set_cell(x,y, floor(abs(osn.get_noise_2d(x,y)*3)))
	put_a_wall()


func put_a_wall() -> void:
	for x in width:
		for y in height:
			tilemap.set_cell(x,0,1)
			tilemap.set_cell(x,height-1,1)
			tilemap.set_cell(0,y,1)
			tilemap.set_cell(width-1,y,1)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_page_down"):
		do_smth(-1)
	if event.is_action_pressed("ui_page_up"):
		do_smth(1)
	if event.is_action_pressed("ui_end"):
		get_tree().reload_current_scene()


func do_smth(num:int) -> void:
	osn.octaves += num
	osn.period += num
	osn.persistence += num
#	osn.lacunarity += num
	generate_map()
