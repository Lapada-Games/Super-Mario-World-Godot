extends StaticBody2D



func _on_Impact_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$AnimationPlayer.play("bateu")
