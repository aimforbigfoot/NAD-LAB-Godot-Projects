extends Area2D

var mouse_in := false
var followable := false
var diff : Vector2 = Vector2.ZERO


func _on_Block_mouse_entered() -> void:
# only use lines 10-15 if you want to have other blocks to be movable during a click
	diff = (get_global_mouse_position() - global_position)
	for blocks in get_parent().get_children():
		if blocks == self:
			continue
		elif blocks.mouse_in == true:
			blocks.mouse_in = false
	mouse_in = true


func _on_Block_mouse_exited() -> void:
	mouse_in = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in == true:
		diff = (get_global_mouse_position() - global_position)
		followable = true
	if event.is_action_released("click"):
		followable = false 


func _process(delta: float) -> void:
	if followable == true:
		global_position = (get_global_mouse_position() - diff) 
