extends Area2D

@onready var timer = $Timer

#If player body enters area where it dies, (enemy and fall off,) or wins
# pass the win/looste state and start timer and start over the game

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	if _is_player_won():
		Global.game_result = "win"
	else:
		Global.game_result = "lose"
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _is_player_won() -> bool:
	return false #default is false 
