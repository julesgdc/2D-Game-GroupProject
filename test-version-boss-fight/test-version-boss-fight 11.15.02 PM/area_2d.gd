extends Area2D

#@onready var player = $Player
#@export var second_player: PackedScene
#@onready var P1_Heals = false
#@onready var P2_In_Range = false
#@onready var p2_instance = second_player.instantiate()

var healingtarget = null

#func heal_activate():
#	p2_instance.health += 1

func _on_body_entered(body):
	print(body)
	if body.is_in_group("p2g-g"):
		healingtarget = body
		#print("wow")
		

func _process(float):
	#print(p2_instance.health)
	#print(P2_In_Range)
	if Input.is_action_pressed("P1_heal_key") and healingtarget and healingtarget.health < 99:
		healingtarget.health += 1
	

	
	
	


#func _process(float):
#	if Input.is_action_just_pressed("p1_fire"):
#		fire()

# @onready var player = $player
# func _ready():
	# body_entered.connect(_on_body_entered)
	

#func _on_body_entered(body):
	# if body.is_in_group("player"):
#	body.health -= 1
#	print(body.health)
	


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("p2g-g"):
		healingtarget = null # Replace with function body.
