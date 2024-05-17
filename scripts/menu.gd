extends Control

@onready var game_over_label = $GameOverLabel
@onready var you_win_label = $YouWinLabel
@onready var name_label = $NameLabel

func _ready():
	_initialize()

func _initialize():

	# Hide both labels initially
	game_over_label.hide()
	you_win_label.hide()

	# Show the appropriate label based on the game result
	if Global.game_result == "win":
		you_win_label.show()
		name_label.hide()
		
	elif Global.game_result == "lose":
		game_over_label.show()
		name_label.hide()

func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_btn_quit_pressed():
	get_tree().quit()

func _on_btn_objective_pressed():
	get_tree().change_scene_to_file("res://scenes/ui_objective.tscn")

