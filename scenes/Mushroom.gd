extends KinematicBody2D

var motion = Vector2()
var gravity = 30
var speed = 100

func _physics_process(delta):
	motion.y += gravity
	motion.x = speed
	motion = move_and_slide(motion, Vector2.UP)
	
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().name != "Mario":
			speed *= -1
			$RayCast2D.cast_to.x *= -1

func _on_Hitbox_body_entered(body):
	if body is Player:
		body.grow()
		queue_free()
