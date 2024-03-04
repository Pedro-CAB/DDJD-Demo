extends Node2D

enum Effects {Calculator, Monitor, Ruler, Slides, Study, Clear, None}

var state = Effects.None #the effect that is currently selected to be assigned to a student

func _on_action_effect_panel_calculator_selected():
	state = Effects.Calculator
	print("Calculator Selected")

func _on_action_effect_panel_monitor_selected():
	state = Effects.Monitor
	print("Monitor Selected")

func _on_action_effect_panel_ruler_selected():
	state = Effects.Ruler
	print("Ruler Selected")


func _on_action_effect_panel_slides_selected():
	state = Effects.Slides
	print("Slides Selected")


func _on_action_effect_panel_study_selected():
	state = Effects.Study
	print("Study Selected")


func _on_action_effect_panel_clear_selected():
	state = Effects.Clear
	print("Clear Selected")
