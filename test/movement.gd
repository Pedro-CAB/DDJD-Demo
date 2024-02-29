extends Node2D

var student_scene = preload("res://student.tscn")


func _on_level_entrance_spawn_student():
	var student = student_scene.instantiate()
	$"Spawned Students".add_child(student)
