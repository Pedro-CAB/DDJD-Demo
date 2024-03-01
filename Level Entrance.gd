extends Node2D

signal spawn_student()

var student_amount = 5

func _ready():
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	if (student_amount > 0):
		spawn_student.emit()
	student_amount -= 1
