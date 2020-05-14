extends Area2D

signal update_score
onready var tween := $Tween
onready var timer := $Timer
export var bonk_height := 50
export var ease_value := 0.5
var rand_int : int
var hitable : bool = false
var mouse_in : bool = false
var init_pos : Vector2

func _ready() -> void:
	init_pos = global_position
# warning-ignore:return_value_discarded
	connect("update_score", get_parent(), "score_update")
	randomize()


func _on_Timer_timeout() -> void:
#	Super complex AI to determine Mole behaviour
	rand_int = randi() % 11
	if rand_int > 5 and hitable == false:
		hitable = true
		move_up()
	elif rand_int <= 5 and hitable == true:
		hitable = false
		move_down()


func move_up() -> void:
	$CollisionShape2D.disabled = false
	tween.interpolate_property(self, "position", position,
	(position-Vector2(0,bonk_height)), 0.25, Tween.TRANS_CUBIC,
	Tween.EASE_OUT, 0)
	tween.start()
	timer.start()


func move_down() -> void:
	$CollisionShape2D.disabled = true
	tween.interpolate_property(self, "position", position, init_pos,
	0.25, Tween.TRANS_CUBIC, Tween.EASE_OUT, 0)
	tween.start()
	timer.start()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouse_in == true and hitable == true:
		move_down()
		emit_signal("update_score")


func _on_GodotMole_mouse_entered() -> void:
	mouse_in = true


func _on_GodotMole_mouse_exited() -> void:
	mouse_in = false
