class_name Obstacle

extends MovingArea2D

func _on_body_entered(body):
	body.queue_free()
