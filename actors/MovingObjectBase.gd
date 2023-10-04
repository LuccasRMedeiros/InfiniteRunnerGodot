extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):

	velocity.x = SPEED * -1

	move_and_slide()

	if position.x < -10:
		queue_free()

	print("position.x = ", position.x)
