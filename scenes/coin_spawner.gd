extends Node

const SPAWN_CHANCE = 0.3
var SPAWN_TRIGGER: float = 0.0

var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	SPAWN_TRIGGER += SPAWN_CHANCE * delta
	
	if SPAWN_TRIGGER >= 1.0:
		var y = rng.randi_range(96, 496)
		var group = preload("res://actors/CoinGroup.tscn").instantiate()

		group.position.y = y

		add_child(group)

		SPAWN_TRIGGER = 0.0
