class_name Player

extends CharacterBody2D

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_select"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func _on_tree_exited():
	Globals.global_speed = 0.0
