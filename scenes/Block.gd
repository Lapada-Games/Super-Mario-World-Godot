extends StaticBody2D



func _on_Impact_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		if not body.is_big:
			$AnimationPlayer.play("bateu")
		else:
			body.break_block()
			queue_free()
