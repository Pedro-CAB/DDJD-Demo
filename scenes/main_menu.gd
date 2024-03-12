extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/test/movement.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_how_to_play_button_pressed():
	$"How To Play".visible = true
	$Logo.visible = false
	$Buttons.visible = false


func _on_back_button_pressed():
	$"How To Play".visible = false
	$Logo.visible = true
	$Buttons.visible = true
