extends Node2D

const ENEMY_SPAWN_CHANCE = 1.0 / 2.0
var ENEMY_SPAWN_TRIGGER: float

func _ready():
	# Grants that ENEMY_SPAWN_TRIGGER is always initialized to 0
	ENEMY_SPAWN_TRIGGER = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	ENEMY_SPAWN_TRIGGER += ENEMY_SPAWN_CHANCE * delta

	if ENEMY_SPAWN_TRIGGER >= 1.0:	
		ENEMY_SPAWN_TRIGGER = 0.0

		var enemy = preload("res://actors/BasicEnemy.tscn").instantiate()
		enemy.position.x = 1216
		enemy.position.y = 440
		enemy.mov_speed = 300.0

		add_child(enemy)
