extends Area2D
class_name PipeEntrance

export(String, FILE) var scene_to_go


func go_to_scene():
	get_tree().change_scene(scene_to_go)


func _on_PipeEntrance_body_entered(body):
	if body is Player:
		body.is_on_pipe = true


func _on_PipeEntrance_body_exited(body):
	if body is Player:
		body.is_on_pipe = false


func _on_Mario_entered_pipe():
	$Timer.start()


func _on_Timer_timeout():
	go_to_scene()
