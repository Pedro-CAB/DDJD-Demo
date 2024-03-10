extends Control

signal calculator_selected()
signal monitor_selected()
signal ruler_selected()
signal slides_selected()
signal study_selected()
signal clear_selected()


func _on_calculator_button_pressed():
	calculator_selected.emit()
	print("Calculator")


func _on_monitor_button_pressed():
	monitor_selected.emit()
	print("Monitor")


func _on_ruler_button_pressed():
	ruler_selected.emit()
	print("Ruler")


func _on_slides_button_pressed():
	slides_selected.emit()
	print("Slides")


func _on_study_button_pressed():
	study_selected.emit()
	print("Study")


func _on_clear_button_pressed():
	clear_selected.emit()
	print("Clear")
