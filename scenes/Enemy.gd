extends KinematicBody2D

var gravity = 30
var motion = Vector2()
var UP = Vector2(0, -1)
const MAXVELOCITY = 100
const ACCELERATION = 30

var flip = false
var pause = false

func _physics_process(delta):
#	motion.y += gravity
	
	if not pause:
		if not flip:
	#		motion.x = min(motion.x+ACCELERATION, MAXVELOCITY)
			motion.x = MAXVELOCITY
			$Sprite.play("run")
		elif flip:
	#		motion.x = max(motion.x-ACCELERATION, -MAXVELOCITY)
			motion.x = -MAXVELOCITY
			$Sprite.play("run")


		motion = move_and_slide(motion, UP)
	
	if not $RayCast2D.is_colliding():
		flip()
		$Sprite.play("idle")
		$PatrulhaTimer.start()
		pause = true
	

func flip():
	flip = not flip
	scale.x = scale.x * -1

func _on_PatrulhaTimer_timeout():
	pause = false


func _on_Impact_body_entered(body):
	if body is Player:
		if body.is_alive:
			queue_free()
			body.motion.y = body.JUMP_FORCE



func _on_Hurtbox_body_entered(body):
	if body is Player:
		if not body.is_falling():
			body.die()
