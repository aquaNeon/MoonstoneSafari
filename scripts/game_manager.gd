extends Node

signal moonstone_count_updated

var score = 0

# Connect the HUD to update the score label
@onready var hud = %HUD

func add_point(): 
	score += 1
	hud.update_score(score)
	emit_signal("moonstone_count_updated", score)
