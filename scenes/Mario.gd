extends KinematicBody2D
class_name Player

var gravity = 30
var motion = Vector2()
var UP = Vector2(0, -1)
const MAXVELOCITY = 250
const ACCELERATION = 30
var JUMP_FORCE = -650
var jump = false
var jump_count = 1

func _ready():
	position.x = 180
	position.y = 360

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
		
	if Input.is_action_just_pressed("ui_up") and jump_count > 0:
		jump_count -= 1
		motion.y = JUMP_FORCE
		
	if is_on_floor():
		jump_count = 1
		
	else:
		if motion.y < 0:
			$Sprite.play("jump")
			
		else:
			$Sprite.play("fall")
		motion.x = lerp(motion.x, 0, 0.05)
	
	
	
	motion = move_and_slide(motion, UP)


func die():
	$AnimationPlayer.play("Dead")
