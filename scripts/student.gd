extends CharacterBody2D

signal is_clicked(node)
signal is_hovered(node)
signal is_not_hovered(node)

var paused = false

const SPEED = 100.0 #Standard Speed

enum Effects {Calculator, Monitor, Ruler, Slides, Study, CLear, None, Dead}
var state = Effects.None #by default, the student has no effects applied

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var prev_direction : Vector2 #to save direction before stopping
var direction : Vector2
var last_direction : Vector2

func _ready():
	direction = Vector2.RIGHT
	last_direction = direction
	$".".floor_max_angle = 1.3
	clear_role()

func clear_role():
	direction = last_direction
	for child in $"Action Icons".get_children():
		child.visible = false

func _process(_delta):
	if ($".".state == Effects.Calculator):
		$"Action Icons/Calculator".visible = true
	if ($".".state == Effects.Monitor):
		$"Action Icons/Monitor".visible = true
	if ($".".state == Effects.Ruler):
		$"Action Icons/Ruler".visible = true
	if ($".".state == Effects.Slides):
		$"Action Icons/Slides".visible = true
		direction = Vector2.ZERO
		set_collision_layer_value(2,true)
		set_collision_mask_value(1, true)
		$AnimatedSprite2D.play("Idle")
	if ($".".state == Effects.Study):
		$"Action Icons/Study".visible = true
	if ($".".state == Effects.None or $".".state == Effects.CLear):
		clear_role()
	if ($".".state == Effects.Dead):
		direction = Vector2.ZERO


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && not paused && state != Effects.Dead:
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("Falling")
	elif state != Effects.Dead:
		$AnimatedSprite2D.play("Running")
	
	if is_on_wall() && state != Effects.Slides && not paused:
		direction.x = - direction.x
		$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h
		last_direction = direction

	if not paused:
		velocity.x = direction.x * SPEED
		move_and_slide()
	else:
		$AnimatedSprite2D.stop()
	
func pause():
	last_direction = direction
	direction = Vector2.ZERO
	paused = true

func unpause():
	direction = last_direction
	paused = false

# Stop Student Movement for time seconds
func temporary_stop(time):
	prev_direction = direction
	direction = Vector2.ZERO
	$"Stop Timer".start(time)
	
func kill():
	state = Effects.Dead
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play("Death")
	clear_role()
	$"Action Icons/Dead".visible = true
	direction = Vector2.ZERO
	

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
