extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None}

var student_scene = preload("res://scenes/elements/student.tscn")

func _ready():
	# How Many Students Should Spawn?
	$"Level Entrance".student_amount = 20
	
func _process(_delta):
	var direction = Input.get_vector("Move Camera Left","Move Camera Right","Move Camera Up","Move Camera Down")
	if $Camera2D.position.x + direction.x * 10 > 581 && $Camera2D.position.x + direction.x * 10 < 1725:
		$Camera2D.position.x += direction.x * 10
		$"Action Assigner".position.x += direction.x * 10
	if $Camera2D.position.y + direction.y * 10 > 324 && $Camera2D.position.y + direction.y * 10 < 824:
		$Camera2D.position.y += direction.y * 10
		$"Action Assigner".position.y += direction.y * 10

func _on_level_entrance_spawn_student():
	var student = student_scene.instantiate()
	student.connect("is_clicked",_on_student_is_clicked)
	student.connect("is_hovered",_on_student_is_hovered)
	student.connect("is_not_hovered",_on_student_is_not_hovered)
	student.position = $"Level Entrance".global_position
	student.scale = Vector2(3,3)
	$"Spawned Students".add_child(student,true)


func _on_student_is_clicked(node):
	if Input.is_action_just_pressed("Assign  Action or Effect"):
		if $"Action Assigner".state != 6:
			node.state = $"Action Assigner".state
			$"Action Assigner".state = Effects.None

func _on_student_is_hovered(node):
	pass
	
func _on_student_is_not_hovered(node):
	pass


func _on_pile_of_paper_study_found_paper(student, paper):
	print("Study Found Paper!")
	student.temporary_stop(1.5)  #Student stops moving for 1.5 secs
	paper.queue_free() #Delete Paper Pile 
	student.state = 6 # Set Student state to None again
