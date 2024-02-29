extends Node2D

signal spawn_student()

var student_amount:int = 20

func _process(delta):
	if student_amount > 0:
		student_amount -= 1
		$SpawnTimer.start(1)
	else:
		pass

func _on_spawn_timer_timeout():
	spawn_student.emit()
