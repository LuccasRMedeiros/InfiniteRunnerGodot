extends MovingArea2D


func _on_body_entered(_body):
	Globals.score_coin += 1

	queue_free()
