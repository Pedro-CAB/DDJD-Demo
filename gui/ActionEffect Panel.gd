extends Control

signal calculator_selected()
signal monitor_selected()
signal ruler_selected()
signal slides_selected()
signal study_selected()
signal clear_selected()
signal dead_selected()

var calculator_amount = 5
var ruler_amount = 5
var slides_amount = 5
var study_amount = 5
var clear_amount = 5
var dead_amount = 0

func _ready():
	update_display()

func update_display():
	$"Amounts/Calculator".text = str(calculator_amount)
	$"Amounts/Ruler".text = str(ruler_amount)
	$"Amounts/Slides".text = str(slides_amount)
	$"Amounts/Study".text = str(study_amount)
	$"Amounts/Clear".text = str(clear_amount)

func get_used():
	print(calculator_amount)
	print(ruler_amount)
	print(slides_amount)
	print(study_amount)
	print(clear_amount)
	return (25 - calculator_amount - ruler_amount - slides_amount - study_amount - clear_amount)

func _on_calculator_button_pressed():
	if calculator_amount > 0:
		calculator_selected.emit()
		$"Amounts/Calculator".text = str(calculator_amount)


func _on_ruler_button_pressed():
	if ruler_amount > 0:
		ruler_selected.emit()
		$"Amounts/Ruler".text = str(ruler_amount)


func _on_slides_button_pressed():
	if slides_amount > 0:
		slides_selected.emit()
		$"Amounts/Slides".text = str(slides_amount)


func _on_study_button_pressed():
	if study_amount > 0:
		study_selected.emit()
		$"Amounts/Study".text = str(study_amount)


func _on_clear_button_pressed():
	if clear_amount > 0:
		clear_selected.emit()
		$"Amounts/Clear".text = str(clear_amount)
