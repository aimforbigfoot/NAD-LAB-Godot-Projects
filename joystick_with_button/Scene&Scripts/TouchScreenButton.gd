extends TouchScreenButton

var player : KinematicBody2D

func _ready() -> void:
	player = get_parent().get_node("player")


func _on_TouchScreenButton_pressed() -> void:
	player.twist()
#	player.rotation = rand_range(-PI, PI)
	pass # Replace with function body.
