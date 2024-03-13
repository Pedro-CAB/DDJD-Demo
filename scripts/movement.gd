extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None, Dead}

var student_scene = preload("res://scenes/elements/student.tscn")

const camera_speed = 10

var is_paused = false
var pause_updated = false

# How many reached the exit?
var students_survived = 0
var dead_students = 0

# How many students can traverse the shortcut before it closes?
var shortcut_limit = 15

func pause_game(value):
	if value:
		$"Entrance and Exit/Level Entrance".pause()
		for s in $"Spawned Students".get_children():
			s.pause()
			$"GUI/CanvasLayer/Pause Menu".visible = true
			$"GUI/Action Assigner/CanvasLayer".visible = false
			is_paused = true
	else:
		$"Entrance and Exit/Level Entrance".unpause()
		for s in $"Spawned Students".get_children():
			s.unpause()
			$"GUI/CanvasLayer/Pause Menu".visible = false
			$"GUI/Action Assigner/CanvasLayer".visible = true
			is_paused = false
	
	
func _process(_delta):
	#Win/Lose Condition
	if dead_students > 10 or dead_students + students_survived == 20:
		show_score()
		
	if students_survived >= 10:
		$"GUI/CanvasLayer/Finish Game".visible = true
	
	
	if Input.is_action_just_pressed("Pause and Unpause") or pause_updated:
		pause_updated = false
		if is_paused: pause_game(false)
		else: pause_game(true)
	if Input.is_action_pressed("Move Camera Left") && not is_paused:
		if $Camera2D.position.x - camera_speed > 576:
			$Camera2D.position.x = $Camera2D.position.x - camera_speed
	elif Input.is_action_pressed("Move Camera Right") && not is_paused:
		if $Camera2D.position.x + camera_speed < 1771:
			$Camera2D.position.x = $Camera2D.position.x + camera_speed
	if Input.is_action_pressed("Move Camera Up") && not is_paused:
		if $Camera2D.position.y - camera_speed > 275:
			$Camera2D.position.y = $Camera2D.position.y - camera_speed
	elif Input.is_action_pressed("Move Camera Down") && not is_paused:
		if $Camera2D.position.y + camera_speed < 831:
			$Camera2D.position.y = $Camera2D.position.y + camera_speed
	if shortcut_limit == 0 && $"One-Way Shortcut" != null:
		$"One-Way Shortcut".queue_free()
		
func show_score():
	pause_game(true)
	$"GUI/CanvasLayer/Score Menu".display_score(students_survived,dead_students,$"GUI/Action Assigner".get_used())
	$"GUI/CanvasLayer/Score Menu".visible = true

func _on_level_entrance_spawn_student():
	var student = student_scene.instantiate()
	student.connect("is_clicked",_on_student_is_clicked)
	student.connect("is_hovered",_on_student_is_hovered)
	student.connect("is_not_hovered",_on_student_is_not_hovered)
	student.scale = Vector2(3.5,3.5)
	$"Spawned Students".add_child(student,true)


func _on_student_is_clicked(node):
	if Input.is_action_just_pressed("Assign  Action or Effect"):
		if $"GUI/Action Assigner".state != Effects.None:
			node.state = $"GUI/Action Assigner".state
			$"GUI/Action Assigner".reduce_effect()
			$"GUI/Action Assigner".update_display()
			$"GUI/Action Assigner".state = Effects.None

func _on_student_is_hovered(node):
	pass
	
func _on_student_is_not_hovered(node):
	pass


func _on_pile_of_paper_study_found_paper(student, paper):
	print("Study Found Paper!")
	student.temporary_stop(1.5)  #Student stops moving for 1.5 secs
	paper.queue_free() #Delete Paper Pile 
	student.state = Effects.None # Set Student state to None again


func _on_level_exit_student_arrived_exit(node):
	students_survived += 1
	update_counter()

func update_counter():
	var txt = ""
	txt += str($"Entrance and Exit/Level Entrance".student_amount) + "   Total"
	if(students_survived < 10):
		txt += "\n0" + str(students_survived) + " Exited"
	else:
		txt += "\n" + str(students_survived) + " Exited"
	if(dead_students < 10):
		txt += "\n0" + str(dead_students) + "   Dead"
	else:
		txt += "\n" + str(dead_students) + "   Dead"
	$"GUI/CanvasLayer/Student Counter".text = txt

func _on_level_exit_student_arrived_despawner(node):
	node.queue_free()


func _on_shortcut_entrance_body_entered(body):
	print("Student Entered Shortcut!")
	if shortcut_limit > 0:
		body.global_position = $"One-Way Shortcut/Shortcut Exit".global_position
		shortcut_limit -= 1
		$"One-Way Shortcut/Counter".text = str(shortcut_limit)


func _on_calculator_detection_body_entered(body):
	if (body.state == Effects.Calculator) && not $Stairways/Stairway2.visible:
		$Stairways/Stairway2.visible = true
		$Stairways/Stairway2.set_collision_layer_value(2,true)
		$Stairways/Stairway2.set_collision_mask_value(1,true)
		body.state = Effects.None

func _on_calculator_detection_2_body_entered(body):
	if (body.state == Effects.Calculator)  && not $Stairways/Stairway.visible:
		$Stairways/Stairway.visible = true
		$Stairways/Stairway.set_collision_layer_value(2,true)
		$Stairways/Stairway.set_collision_mask_value(1,true)
		body.state = Effects.None

func _on_calculator_detection_3_body_entered(body):
	if (body.state == Effects.Calculator) && not $Stairways/Stairway3.visible:
		$Stairways/Stairway3.visible = true
		$Stairways/Stairway3.set_collision_layer_value(2,true)
		$Stairways/Stairway3.set_collision_mask_value(1,true)
		body.state = Effects.None


func _on_pause_menu_resume_game():
	pause_updated = true


func _on_pause_menu_restart_game():
	get_tree().change_scene_to_file("res://scenes/test/movement.tscn")


func _on_pause_menu_back_to_menu():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_rock_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()
	
func _on_rock_2_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()

func _on_rock_3_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()


func _on_rock_4_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()


func _on_rock_5_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()


func _on_rock_6_student_died(body):
	dead_students +=1
	body.kill()
	update_counter()


func _on_finish_game_pressed():
	show_score()
