extends Node2D

export var speed_multi := 5.0

func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)
	OS.window_per_pixel_transparency_enabled = true
#I was going to say this, but the documentation said the best
#If true, the window background is transparent and window frame is removed.
#Use get_tree().get_root().set_transparent_background(true) to disable main
#viewport background rendering.
##Note: This property has no effect if Project >d Project Settings > Display > Window > Per-pixel transparency > Allowed setting is disabled.
##Note: This property is implemented on HTML5, Linux, macOS and Windows.



func _process(delta: float) -> void:
	var vel : Vector2 = Vector2.ZERO
	vel.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	vel.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	OS.window_position += vel*speed_multi
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()
