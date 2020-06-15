extends Node2D

onready var l1 := $Line2D
onready var l2 := $Line2D2
onready var l3 := $Line2D3
onready var l4 := $Line2D4
onready var label1 := $Label1
onready var label2 := $Label2
onready var label3 := $Label3
onready var label4 := $Label4
onready var apc := $A_p_c
onready var bpd := $B_p_d
var screensize : Vector2

func _ready() -> void:
	screensize = get_viewport_rect().size
	l2.points[1] = screensize
	l3.points[0].x = screensize.x
	l4.points[0].y = screensize.y


func _process(delta: float) -> void:
	l1.points[1] = get_global_mouse_position()
	set_the_label_pos_and_text(label1, l1, "A")
	
	l2.points[0] =  get_global_mouse_position()
	set_the_label_pos_and_text(label2, l2,  "C")
	
	l3.points[1] =  get_global_mouse_position()
	set_the_label_pos_and_text(label3, l3, "B")
	
	l4.points[1] =  get_global_mouse_position()
	set_the_label_pos_and_text(label4, l4, "D")
	
	apc.text = ("(Squared) A + C:  " + ( str(pow(float(label1.text), 2) + pow(float(label2.text), 2)) ))
	bpd.text = ("(Squared) B + D:  " + ( str(pow(float(label3.text), 2) + pow(float(label4.text), 2)) ))


func set_the_label_pos_and_text(label_num, line_var, letter : String) -> void:
	label_num.rect_global_position = ((line_var.points[0] + line_var.points[1])/2) + Vector2(0,50)
	if letter == "A":
		label_num.text = ( str(float(line_var.points[1].length())))
	else:
		label_num.text = ( str(float( ((line_var.points[1]) - (line_var.points[0])).length() ) ))
