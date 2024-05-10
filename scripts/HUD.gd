extends CanvasLayer

@onready var stone_count_label = $HBox/StoneCount
@onready var moonstone_image = $HBox/MoonstoneImage
# Called when the node enters the scene tree for the first time.
func _ready():
	var texture = load("res://assets/textures/moonstone.png")
	moonstone_image.texture = texture
	$HBox/StoneCount.text =" 0/10"

# Function to update the score label in the HUD
func update_score(score):
	stone_count_label.text = str(score) + "/10"
