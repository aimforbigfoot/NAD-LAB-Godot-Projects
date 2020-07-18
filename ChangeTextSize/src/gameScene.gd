extends Node2D

onready var label_style := preload("res://assets/biglabel.tres")
export var amt := 10

func _on_Increase_pressed() -> void:
	label_style.size += amt


func _on_Decrease_pressed() -> void:
	label_style.size -= amt
