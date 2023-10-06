extends KinematicBody2D

var motion = Vector2()
var gravity = 30

func _physics_process(delta):
	motion.y += gravity
	motion.x = 100
	motion = move_and_slide(motion, Vector2.UP)


func _on_Hitbox_body_entered(body):
	if body is Player:
		body.grow()
		queue_free()
