extends Control

#TODO Implementing Code to Generate the Score According to the Values

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func display_score(survivors,deaths,actions):
	# Clears do not count as actions
	var total_score = (survivors - deaths) - actions
