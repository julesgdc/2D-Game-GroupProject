extends CharacterBody2D

var health = 10
var facing = Vector2.RIGHT
const SPEED = 100.0
# const JUMP_VELOCITY = -400.0

# @export var bullet_scene: PackedScene
@export var bullet_scene_2: PackedScene
@onready var bulletspawn = $bulletspawn
@onready var animated_sprite = $AnimatedSprite2D
@onready var healthbar = $health_label

func fire():
	var new_bullet = bullet_scene_2.instantiate()
	# bullet = bullet_scene_2
	new_bullet.direction = facing
	new_bullet.shooter = self
	# print(facing)
	get_parent().add_child(new_bullet)
	new_bullet.position = bulletspawn.global_position

func _process(float):
	if Input.is_action_just_pressed("p1_fire"):
		fire()
	healthbar.text = str(health)

func _physics_process(delta):
	# Add the gravity.
	# if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("alt_left", "alt_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var direction2 := Input.get_axis("alt_up", "alt_down")
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction or direction2:
		facing = Vector2(direction, direction2).normalized()

	#flips sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#running animation
	if direction == 0 and direction2 == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("move")

	move_and_slide()
	
	if health < 1:
		queue_free()
	
	
