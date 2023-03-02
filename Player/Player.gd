extends CharacterBody2D

const ACCELERATION = 800
const MAX_SPEED = 100
const FRICTION = 400

@onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		animationPlayer.play("RunRight")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animationPlayer.play("IdleRight")

	move_and_slide()
