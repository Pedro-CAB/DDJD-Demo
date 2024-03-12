extends Control

signal calculator_selected()
signal monitor_selected()
signal ruler_selected()
signal slides_selected()
signal study_selected()
signal clear_selected()

var calculator_amount = 3
var monitor_amount = 3
var ruler_amount = 3
var slides_amount = 3
var study_amount = 3
var clear_amount = 3

func _on_calculator_button_pressed():
	if calculator_amount > 0:
		calculator_selected.emit()
		calculator_amount -= 1
		$"Amounts/Calculator".text = str(calculator_amount)


func _on_monitor_button_pressed():
	if monitor_amount > 0:
		monitor_selected.emit()
		monitor_amount -= 1
		$"Amounts/Monitor".text = str(monitor_amount)


func _on_ruler_button_pressed():
	if ruler_amount > 0:
		ruler_selected.emit()
		ruler_amount -= 1
		$"Amounts/Ruler".text = str(ruler_amount)


func _on_slides_button_pressed():
	if slides_amount > 0:
		slides_selected.emit()
		slides_amount -= 1
		$"Amounts/Slides".text = str(slides_amount)


func _on_study_button_pressed():
	if study_amount > 0:
		study_selected.emit()
		study_amount -= 1
		$"Amounts/Study".text = str(study_amount)


func _on_clear_button_pressed():
	if clear_amount > 0:
		clear_selected.emit()
		clear_amount -= 1
		$"Amounts/Clear".text = str(clear_amount)
