extends StaticBody2D

signal study_found_paper(student,paper)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_student_detection_body_entered(body):
	print(body.state)
	if(body.state == 4): # Study Action Detection
		study_found_paper.emit(body, $".")
