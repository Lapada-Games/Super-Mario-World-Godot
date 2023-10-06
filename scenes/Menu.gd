extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Hud.visible = false
	Global.reset()
	Hud.update_hud()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		Hud.visible = true
		get_tree().change_scene("res://scenes/Levels/Level1.tscn")
