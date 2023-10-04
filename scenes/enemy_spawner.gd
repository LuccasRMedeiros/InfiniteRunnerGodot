extends Node2D

var spawn_enemy = true

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if spawn_enemy:	
		spawn_enemy = false
		await get_tree().create_timer(2.0, true, false, false).timeout

		print("Should spawn enemy now")

		var enemy = preload("res://actors/BasicEnemy.tscn").instantiate()
		enemy.position.x = 1128
		enemy.position.y = 16

		add_child(enemy)
