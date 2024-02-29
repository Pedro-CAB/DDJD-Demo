extends CharacterBody2D


const SPEED = 100.0

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
