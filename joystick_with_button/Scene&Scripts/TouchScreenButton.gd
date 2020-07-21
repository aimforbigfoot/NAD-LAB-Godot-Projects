extends TouchScreenButton

var player

func _ready() -> void:
	player = get_parent().get_child(0)


func _on_TouchScreenButton_pressed() -> void:
	player.rotation = rand_range(-PI, PI)
	pass # Replace with function body.
