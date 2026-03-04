extends Area2D


#@onready var player = $SecondPlayer
#@onready var P2_Heals = false
#@onready var P1_In_Range = false

var healingtarget = null

func _on_body_entered(body):
	print(body)
	if body.is_in_group("p1g-g"):
		healingtarget = body
		print("wow2")
		

func _process(float):
	if Input.is_action_pressed("P2_heal_key") and healingtarget and healingtarget.health < 99:
		healingtarget.health += 1



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("p1g-g"):
		healingtarget = null # Replace with function body.
