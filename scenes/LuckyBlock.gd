extends StaticBody2D

var hit = false

func _on_Impact_body_entered(body):
	if not hit:
		$AnimationPlayer.play("Bateu")
		hit = true
