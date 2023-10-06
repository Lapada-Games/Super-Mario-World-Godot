extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_hud()

func update_hud():
	$CoinsLabel.text = str(Global.coins)
	$LifesLabel.text = "x" + str(Global.lifes)
	$LevelLabel.text = "LEVEL " + str(Global.level)
