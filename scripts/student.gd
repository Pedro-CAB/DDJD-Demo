extends CharacterBody2D

signal is_clicked(node)
signal is_hovered(node)
signal is_not_hovered(node)

const SPEED = 25.0

enum Effects {Calculator, Monitor, Ruler, Slides, Study, CLear, None}
var state = Effects.None #by default, the student has no effects applied

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	direction = Vector2.RIGHT


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_wall():
		direction.x = - direction.x
		$Sprite2D.flip_h = !$Sprite2D.flip_h

	velocity.x = direction.x * SPEED

	move_and_slide()

# Check if Student was clicked
func _on_clickable_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Assign  Action or Effect"):
		is_clicked.emit($".")

func _on_clickable_area_mouse_entered():
	is_hovered.emit($".")
	

func _on_clickable_area_mouse_exited():
	is_not_hovered.emit($".")
