extends KinematicBody2D

var gravity = 30
var motion = Vector2()
var UP = Vector2(0, -1)
const MAXVELOCITY = 250
const ACCELERATION = 30
var JUMP_FORCE = -650
var jump = false


func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAXVELOCITY)
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAXVELOCITY)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_FORCE
			
	else:
		if motion.y < 0:
			$Sprite.play("jump")
			
		else:
			$Sprite.play("fall")
		motion.x = lerp(motion.x, 0, 0.05)
	
	
	
	motion = move_and_slide(motion, UP)
