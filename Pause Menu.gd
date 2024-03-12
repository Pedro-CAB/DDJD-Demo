extends Control

signal resume_game()
signal restart_game()
signal back_to_menu()

func _on_resume_button_pressed():
	resume_game.emit()


func _on_restart_button_pressed():
	restart_game.emit()



func _on_menu_button_pressed():
	back_to_menu.emit()
