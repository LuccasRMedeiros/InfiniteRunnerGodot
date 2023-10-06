class_name MovingArea2D

extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_coord = get_global_transform_with_canvas().get_origin()

	position.x -= Globals.global_speed * delta

	if screen_coord.x < -100.0:
		queue_free()
