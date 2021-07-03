extends Node2D

func _ready() -> void:
	SaveScript.load_val()


func _on_GameScene_tree_exiting() -> void:
	print("main exited")
