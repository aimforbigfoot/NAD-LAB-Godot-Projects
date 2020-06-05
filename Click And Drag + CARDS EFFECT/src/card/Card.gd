extends Area2D

var mouse_in := false
var followable  := false
var diff : Vector2 = Vector2.ZERO
onready var tween := $Tween
export var dur := 0.5

var pos := Vector2.ZERO

func _ready() -> void:
	pos = global_position


func _process(delta: float) -> void:
	if followable:
		global_position = (get_global_mouse_position() - diff) 


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
	mouse_in = true


func _on_Card_mouse_exited() -> void:
	mouse_in = false
