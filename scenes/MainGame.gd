extends Node2D

const BASE_SPEED = 300.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	Globals.global_speed = BASE_SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Globals.score_distance += (Globals.global_speed / BASE_SPEED) * delta
	Globals.global_speed += delta / 2.0
	
	print(
		"score distance: ", Globals.score_distance,
		"\nscore coin ", Globals.score_coin,
	)
