extends Area2D
signal course_clear
var position_diff = 0

func _on_Pole_body_entered(body):
	if body is Player:
		body.down_pole($Final.global_position)
		emit_signal("course_clear")
