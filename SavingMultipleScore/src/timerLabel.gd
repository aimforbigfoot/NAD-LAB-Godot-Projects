extends Label

var time := 0

func _ready() -> void:
	var i_want_to_load_val := true
	if SaveScript.is_file_there() and i_want_to_load_val:
		time = SaveScript.load_val()[0]
		update_labl()

func update_labl() -> void:
	text = ("Time:" + str(time))

func _on_Timer_timeout() -> void:
	time += 1
	update_labl()


func _on_timerLabel_tree_exiting() -> void:
	SaveScript.things_to_save[0] = time
	SaveScript.save_val()
	print("label exited")
#remeber to talk about save warnings and a solution
# which is to just save things once with a main node, b.c it obiouslly has to leave
# last b.c do the children leave first or the parent, 
#obvs the parent (even in real life)
