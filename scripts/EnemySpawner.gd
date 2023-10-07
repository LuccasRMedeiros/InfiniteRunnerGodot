extends Node

const SPAWN_CHANCE = 0.5
var SPAWN_TRIGGER = 0.0

var rng = RandomNumberGenerator.new()

func get_object_from_index(idx: int) -> Node:
	match idx:
		0:
			return preload("res://actors/Wall.tscn").instantiate()
		1:
			return preload("res://actors/Bar.tscn").instantiate()

	return preload("res://actors/InvertedBar.tscn").instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	SPAWN_TRIGGER += SPAWN_CHANCE * delta

	if SPAWN_TRIGGER >= 1.0:
		var obstacle: Node
		var rand_obj_idx = rng.randi_range(0, 2)
		var rand_y = rng.randi_range(520, 80)

		obstacle = get_object_from_index(rand_obj_idx)
		obstacle.position.y = rand_y

		add_child(obstacle)

		SPAWN_TRIGGER = 0.0
