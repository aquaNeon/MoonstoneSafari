extends Area2D

var moonstone_count = 0
var spaceship_animated_sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	spaceship_animated_sprite = $AnimatedSprite2D
	var game_manager = %GameManager  # Adjust path as per your scene structure
	game_manager.connect("moonstone_count_updated", self._on_moonstone_count_updated)

# Function to handle moonstone count updates
func _on_moonstone_count_updated(count):
	moonstone_count = count
	if moonstone_count >= 10:
		play_open_animation()

# Function to play the "open" animation
func play_open_animation():
	spaceship_animated_sprite.play("open")
