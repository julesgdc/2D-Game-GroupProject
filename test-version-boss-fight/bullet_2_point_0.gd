extends Area2D

var speed = 450
var direction = Vector2.RIGHT
var shooter: Node2D

func _physics_process(delta):
	position += direction * speed * delta



# func _process(delta):
	#position += direction * SPEED * delta

# func _on_body_entered(body):
	# if body.is_in_group("player"):
#	body.health -= 1
#	print(body.health)


func _on_body_entered(body):
	if body != shooter and body is not TileMapLayer:
		body.health -= 1
		print(body.health)
		queue_free()
	if body is TileMapLayer:
		queue_free()
