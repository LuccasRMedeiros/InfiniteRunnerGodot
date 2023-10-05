extends Area2D

@export var mov_speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= mov_speed * delta

	if position.x <= -100:
		queue_free()


func _on_area_entered(area):
	print("Collision detected")
