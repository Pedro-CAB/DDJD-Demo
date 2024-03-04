extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None}

var state = Effects.None #the effect that is currently selected to be assigned to a student

func _on_action_effect_panel_calculator_selected():
	state = Effects.Calculator

func _on_action_effect_panel_monitor_selected():
	state = Effects.Monitor

func _on_action_effect_panel_ruler_selected():
	state = Effects.Ruler


func _on_action_effect_panel_slides_selected():
	state = Effects.Slides


func _on_action_effect_panel_study_selected():
	state = Effects.Study


func _on_action_effect_panel_clear_selected():
	state = Effects.Clear
