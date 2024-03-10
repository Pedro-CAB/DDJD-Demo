extends Node2D

signal student_arrived_exit(node)

signal student_arrived_despawner(node)


func _on_student_detector_body_entered(body):
	student_arrived_exit.emit(body)

func _on_student_despawner_body_entered(body):
	student_arrived_despawner.emit(body)
