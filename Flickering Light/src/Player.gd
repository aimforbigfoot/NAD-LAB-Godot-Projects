extends Node2D

onready var timer := $Timer
onready var light := $Light2D

func _ready() -> void:
	randomize()


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()


func _on_Timer_timeout() -> void:
	var rand_amt := (randf())
	print(rand_amt)
	light.energy = rand_amt
# Very flashy
#	if rand_amt < 0.50:
#		light.energy = 1
## More calm, but still flashy
	if rand_amt < 0.50:
		light.energy = 1
	elif rand_amt > 0.75:
		light.energy = 0.75
#	timer.start(rand_amt/rand_range(1,20))
	timer.start(rand_amt/20)
