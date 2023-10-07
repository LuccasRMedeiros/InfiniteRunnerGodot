extends Node2D

const BASE_SPEED = 300.0
enum states {RUNNING, PAUSED, OVER}

signal game_started
signal game_paused
signal game_over

var game_state: states

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.global_speed = 0.0
	Globals.score_distance = 0

	game_state = states.PAUSED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match game_state:
		states.RUNNING:
			Globals.global_speed += delta
			Globals.score_distance += (Globals.global_speed * delta) / BASE_SPEED

		states.OVER:
			Globals.global_speed = 0.0


func _on_character_body_2d_player_died():
	game_state = states.OVER


func _on_button_start_started_game():
	game_state = states.RUNNING
	Globals.global_speed = BASE_SPEED
	game_started.emit()
