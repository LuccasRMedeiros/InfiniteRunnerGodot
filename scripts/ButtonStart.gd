extends Area2D

signal started_game

var button_color: Color
var button_hover = Color(0.36, 0.36, 0.36)
var is_mouse_in = false

func _ready():
	button_color = $ButtonShape.color

func _process(_delta):
	if Input.is_action_just_pressed("ui_select") and is_mouse_in:
		started_game.emit()

		visible = false

func _on_mouse_entered():
	$ButtonShape.set_color(button_hover)

	is_mouse_in = true

func _on_mouse_exited():
	$ButtonShape.set_color(button_color)

	is_mouse_in = false


func _on_character_body_2d_player_died():
	visible = true
