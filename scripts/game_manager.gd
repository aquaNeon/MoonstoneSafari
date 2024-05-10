extends Node

var score = 0

# Connect the HUD to update the score label
@onready var hud = %HUD

func add_point(): 
	score += 1
	hud.update_score(score)
