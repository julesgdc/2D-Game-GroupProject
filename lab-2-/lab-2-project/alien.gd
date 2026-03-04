extends Sprite2D

@export var speed = 300

func _process(delta):
	var move = 0

	if Input.is_action_pressed("ui_right"):
		move = 1
	elif Input.is_action_pressed("ui_left"):
		move = -1
	else:
		move = 0

	position.x += move * speed * delta
