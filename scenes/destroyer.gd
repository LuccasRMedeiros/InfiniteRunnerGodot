extends Area2D


func _on_body_entered(body):
	print("Destroying: ", body.name)

	body.queue_free()
