extends Area2D

var in_place := false
var mouse_in := false
var followable  := false
var diff : Vector2 = Vector2.ZERO
onready var tween := $Tween
export var dur := 0.3
export var mar := 30

var pos := Vector2.ZERO


func _ready() -> void:
	randomize()
	pos = global_position


func _process(_delta: float) -> void:
	if followable:
		global_position = (get_global_mouse_position() - diff) 
	if in_place and Input.is_action_just_released("click"):
		
		pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in == true:
		diff = (get_global_mouse_position() - global_position)
		followable = true
	if event.is_action_released("click"):
		tween.interpolate_property(self, "global_position", global_position, pos, 
		dur, Tween.TRANS_BACK, Tween.EASE_OUT, 0)
		tween.start()
		followable = false 


func _on_Card_mouse_entered() -> void:
#	z_index += 1
	mouse_in = true
	diff = (get_global_mouse_position() - global_position)
	for blocks in get_parent().get_children():
		if blocks == self:
			continue
		elif blocks.mouse_in == true:
			blocks.mouse_in = false
#		z_index -= 1


func _on_Card_mouse_exited() -> void:
	mouse_in = false


func _on_Card_area_entered(area: Area2D) -> void:
	if area.is_in_group("card"):
		pass
	elif area.is_in_group("place"):
		reset_pos(area)


func reset_pos(area:Area2D):
	in_place = true
	pos = area.global_position+Vector2(rand_range(-mar,mar),rand_range(-mar,mar))
	pass
