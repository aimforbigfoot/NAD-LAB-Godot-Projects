extends Spatial


func _ready() -> void:
	$switcher.connect("body_entered",self,"switchToRoom2")

func switchToRoom2(body) -> void:
	if body.is_in_group("player"):
		$Room3.queue_free()
		var room2 := preload("res://src/world/Room4.tscn").instance()
		add_child(room2)
#		$switcher.disconnect("body_entered",self,"switchToRoom2")
		$switcher/CollisionShape.disabled = true
		$shufllingObjects.play()
# you can switch room 3 and 4 with room 1 and 2, just make sure to switch
# room3 in the inspector to room4

func _on_switcher_body_entered(body: Node) -> void:
	pass # Replace with function body.
