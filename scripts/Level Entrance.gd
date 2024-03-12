extends Node2D

signal spawn_student()

# Standard Value
var student_amount = 5
var count

func _ready():
	$SpawnTimer.start()
	count = student_amount

func _on_spawn_timer_timeout():
	if (student_amount > 0):
		spawn_student.emit()
	count -= 1
	
func pause():
	$SpawnTimer.paused = true

func unpause():
	$SpawnTimer.paused = false
