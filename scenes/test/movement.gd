extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None}

var student_scene = preload("res://scenes/elements/student.tscn")

func _ready():
	# How Many Students Should Spawn?
	$"Level Entrance".student_amount = 20

func _on_level_entrance_spawn_student():
	var student = student_scene.instantiate()
	student.connect("is_clicked",_on_student_is_clicked)
	student.connect("is_hovered",_on_student_is_hovered)
	student.connect("is_not_hovered",_on_student_is_not_hovered)
	student.scale = Vector2(1.5,1.5)
	$"Spawned Students".add_child(student,true)


func _on_student_is_clicked(node):
	if Input.is_action_just_pressed("Assign  Action or Effect"):
		node.state = $"Action Assigner".state
		$"Action Assigner".state = Effects.None

func _on_student_is_hovered(node):
	pass
	
func _on_student_is_not_hovered(node):
	pass
