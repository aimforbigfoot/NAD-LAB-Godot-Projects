extends Area2D

export var speed := 600
var vel : Vector2

func _ready() -> void:
	vel = Vector2(speed, 0).rotated(Global.player.deg_for_bullet)
	pass


func _process(delta: float) -> void:
	position += vel * delta



func _on_bullet_area_entered(area: Area2D) -> void:
	queue_free()
	if area.is_in_group("enemy"):
		area.die()



func _on_bullet_body_entered(body: Node) -> void:
	queue_free()
	if body.is_in_group("enemy"):
		body.die()
