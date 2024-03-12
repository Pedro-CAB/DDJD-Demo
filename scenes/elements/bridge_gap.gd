extends Node2D

signal ruler_approaching(node)

enum Effects {Calculator, Monitor, Ruler, Slides, Study, CLear, None}

var is_built = false
var bridge = preload("res://scenes/elements/bridge.tscn")

func build_bridge(body):
	if !is_built && body.state == Effects.Ruler:
		var bridge_node = bridge.instantiate()
		bridge_node.global_position.y = -14.5
		$".".add_child(bridge_node)
		is_built = true
		ruler_approaching.emit(body)
		body.state = Effects.None

func _on_left_cliff_body_entered(body):
	build_bridge(body)
	
func _on_right_cliff_body_entered(body):
	build_bridge(body)
