extends Node

onready var score_label
var score : int = 0

func _ready() -> void:
	score_label = get_parent().get_node("ScoreLabel")
	score_label.text = ("Score: 0")
	pass


func score_update() -> void:
	score += 1
#	score = score + 1
	score_label.text = ("Score: " + str(score))
