extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0
const FRICTION = 0.2  # Friction coefficient
const MAX_JUMP_COUNT = 2  # Maximum number of jumps allowed

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_count = 0

func _physics_process(delta):
	# Add gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or jump_count < MAX_JUMP_COUNT:
			velocity.y = JUMP_VELOCITY
			if is_on_floor():
				jump_count = 1
			else:
				jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	if input_dir > 0:
		animated_sprite.flip_h = false
	elif input_dir < 0:
		animated_sprite.flip_h = true

	# Adjust movement based on input direction
	if is_on_floor():
		if input_dir != 0:
			velocity.x = input_dir * SPEED
			animated_sprite.play("run")
		else:
			# Apply friction
			velocity.x *= FRICTION
			animated_sprite.play("idle")
	else:
		# Still apply horizontal movement in air, but with less intensity
		velocity.x = input_dir * SPEED * 0.5

		# Play jump animation
		animated_sprite.play("jump")

	move_and_slide()
