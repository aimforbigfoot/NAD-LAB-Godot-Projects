extends Node2D

onready var labl := $Label
onready var btn := $Button
var score := 0


func _ready() -> void:
	if SaveScript.is_file_there():
		score = SaveScript.load_val()
		set_labl_text()
		print("file there")
	else:
		print("no file there")
	

func _on_Button_pressed() -> void:
	score += 1
	set_labl_text()


func set_labl_text() -> void:
	labl.text = ("Score: " + str(score))


func _on_GameScene_tree_exiting() -> void:
	SaveScript.save_val(score)
	print("exited well")
