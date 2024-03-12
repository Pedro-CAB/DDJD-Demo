extends CharacterBody2D

signal is_clicked(node)
signal is_hovered(node)
signal is_not_hovered(node)

const SPEED = 100.0 #Standard Speed
#const SPEED = 100.0 #For testing purposes

enum Effects {Calculator, Monitor, Ruler, Slides, Study, CLear, None}
var state = Effects.None #by default, the student has no effects applied

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var prev_direction : Vector2 #to save direction before stopping
var direction : Vector2

func _ready():
	direction = Vector2.RIGHT
	$".".floor_max_angle = 1.3


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_wall():
		direction.x = - direction.x
		$Sprite2D.flip_h = !$Sprite2D.flip_h

	velocity.x = direction.x * SPEED

	move_and_slide()

# Stop Student Movement for time seconds
func temporary_stop(time):
	prev_direction = direction
	direction = Vector2.ZERO
	$"Stop Timer".start(time)
	

# Check if Student was clicked
func _on_clickable_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Assign  Action or Effect"):
		is_clicked.emit($".")

func _on_clickable_area_mouse_entered():
	is_hovered.emit($".")
	

func _on_clickable_area_mouse_exited():
	is_not_hovered.emit($".")


func _on_stop_timer_timeout():
	direction = prev_direction
