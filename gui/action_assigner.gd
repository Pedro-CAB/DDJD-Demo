extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None, Dead}

var state = Effects.None #the effect that is currently selected to be assigned to a student

func update_display():
	$"CanvasLayer/ActionEffect Panel".update_display()

func get_used():
	return $"CanvasLayer/ActionEffect Panel".get_used()

func reduce_effect():
	if(state == Effects.Calculator):
		$"CanvasLayer/ActionEffect Panel".calculator_amount -= 1
	elif(state == Effects.Ruler):
		$"CanvasLayer/ActionEffect Panel".ruler_amount -= 1
	elif(state == Effects.Slides):
		$"CanvasLayer/ActionEffect Panel".slides_amount -= 1
	elif(state == Effects.Study):
		$"CanvasLayer/ActionEffect Panel".study_amount -= 1
	elif(state == Effects.Clear):
		$"CanvasLayer/ActionEffect Panel".clear_amount -= 1
		
func _on_action_effect_panel_calculator_selected():
	state = Effects.Calculator

func _on_action_effect_panel_ruler_selected():
	state = Effects.Ruler


func _on_action_effect_panel_slides_selected():
	state = Effects.Slides


func _on_action_effect_panel_study_selected():
	state = Effects.Study


func _on_action_effect_panel_clear_selected():
	state = Effects.Clear
