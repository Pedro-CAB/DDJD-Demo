extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func display_score(survivors,deaths,actions):
	var abandoned_students = 20 - (survivors + deaths)
	var result_txt = "You Passed!"
	var survivors_txt = "Students Saved:                 +" + str(survivors) + ".00"
	var deaths_txt = "Students Lost:                    -" + str(abandoned_students) + ".00"
	var minimal_action_bonus = 10 - actions
	if (minimal_action_bonus < 0 or survivors < 10 or abandoned_students > 10):
		minimal_action_bonus = 0
	if (survivors < 10 or abandoned_students > 10):
		result_txt = "You Failed!"
	var actions_txt = "Min. Action Bonus:           +" + str(minimal_action_bonus) + ".00"
	var total_score = survivors - abandoned_students - actions + 5
	var total_txt = "Total Grade:                        " + str(total_score) + ".00"
	$"Text Blocks/Result".text = result_txt
	$"Text Blocks/Number of Survivors".text = survivors_txt
	$"Text Blocks/Number of Deaths".text = deaths_txt
	$"Text Blocks/Actions Used".text = actions_txt
	$"Text Blocks/Total Score".text = total_txt


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/test/movement.tscn")
