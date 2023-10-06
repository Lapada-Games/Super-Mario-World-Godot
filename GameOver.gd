extends Node2D



func _on_AudioStreamPlayer_finished():
	get_tree().change_scene("res://scenes/Menu.tscn")
