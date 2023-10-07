class_name Player

extends CharacterBody2D


signal player_died

@onready var anim_player = $AnimationPlayer

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_running: bool

func _ready():
	is_running = false
	anim_player.play("Idle")

func _physics_process(delta):
	if is_running:
		# Add the gravity.
		if not is_on_floor():
			if velocity.y < 0:
				anim_player.play("Jumping")
			else:
				anim_player.play("Falling")

			velocity.y += gravity * delta
		else:
			anim_player.play("Running")

		# Handle Jump.
		if Input.is_action_just_pressed("ui_select"):
			velocity.y = JUMP_VELOCITY

		move_and_slide()

func _on_tree_exited():
	is_running = false
	player_died.emit()


func _on_root_game_started():
	is_running = true
	anim_player.play("Running")
