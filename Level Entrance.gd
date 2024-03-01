extends Node2D

signal spawn_student()

var initial_amount = 5
var student_amount = initial_amount

func _ready():
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	if (student_amount > 0):
		spawn_student.emit()
	student_amount -= 1
