extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None}

var student_scene = preload("res://scenes/elements/student.tscn")

const camera_speed = 10

func _ready():
	# How Many Students Should Spawn?
	$"Level Entrance".student_amount = 20
	
func _process(_delta):
	if Input.is_action_pressed("Move Camera Left"):
		if $Camera2D.position.x - camera_speed > 478:
			$Camera2D.position.x = $Camera2D.position.x - camera_speed
	elif Input.is_action_pressed("Move Camera Right"):
		if $Camera2D.position.x + camera_speed < 1728:
			$Camera2D.position.x = $Camera2D.position.x + camera_speed
	if Input.is_action_pressed("Move Camera Up"):
		if $Camera2D.position.y - camera_speed > 322:
			$Camera2D.position.y = $Camera2D.position.y - camera_speed
	elif Input.is_action_pressed("Move Camera Down"):
		if $Camera2D.position.y + camera_speed < 831:
			$Camera2D.position.y = $Camera2D.position.y + camera_speed

func _on_level_entrance_spawn_student():
	var student = student_scene.instantiate()
	student.connect("is_clicked",_on_student_is_clicked)
	student.connect("is_hovered",_on_student_is_hovered)
	student.connect("is_not_hovered",_on_student_is_not_hovered)
	student.scale = Vector2(1.5,1.5)
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


func _on_level_exit_student_arrived_exit(node):
	print("Student Exited Level")




func _on_level_exit_student_arrived_despawner(node):
	node.queue_free()
