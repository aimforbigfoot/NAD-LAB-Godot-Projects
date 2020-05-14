extends Label

var score := 0
#
#func _ready() -> void:
#	connect("update_score", self,"score_update")
#	text = ("Score:" + str(score))

func score_update() -> void:
	score += 1
	text = "Score:" + str(score)
