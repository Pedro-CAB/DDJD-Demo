extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func display_score(survivors,deaths,actions):
	# Clears do not count as actions
	var survivors_txt = "Students Saved:                 +" + str(survivors) + ".00"
	var deaths_txt = "Students Lost:                    -" + str(deaths + 20 - survivors) + ".00"
	var actions_txt = "Actions Used:                     -" + str(actions) + ".00"
	var total_score = survivors - (deaths + 20 - survivors) - actions + 5
	var total_txt = "Total Grade:                        " + str(total_score) + ".00"
	$"Text Blocks/Number of Survivors".text = survivors_txt
	$"Text Blocks/Number of Deaths".text = deaths_txt
	$"Text Blocks/Actions Used".text = actions_txt
	$"Text Blocks/Total Score".text = total_txt
