extends KinematicBody2D
class_name Player

signal death
signal entered_pipe

var gravity = 30
var motion = Vector2()
var UP = Vector2(0, -1)
const MAXVELOCITY = 250
const ACCELERATION = 30
var JUMP_FORCE = -680
var jump = false
var is_alive = true
var is_big = false
var invincible = false
var is_on_pipe = false

var winner = false
var pole_final_position = null

var current_animation_index = 0

var animations = [
	["run", "idle", "jump", "fall"],
	["run_big", "idle_big", "jump_big", "fall_big"],
]

func _physics_process(delta):
	
	if winner:
		position.x = self.pole_final_position.x
		if position.y <= self.pole_final_position.y:
			position.y += 3
		return
	
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAXVELOCITY)
		$Sprite.flip_h = false
		$Sprite.play(animations[current_animation_index][0])
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAXVELOCITY)
		$Sprite.flip_h = true
		$Sprite.play(animations[current_animation_index][0])
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$Sprite.play(animations[current_animation_index][1])
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = JUMP_FORCE
		$Jump.play()
	
	if Input.is_action_just_pressed("ui_down") and is_on_pipe:
		self.z_index = 0
		set_physics_process(false)
		$AnimationPlayer.play("GoingDownPipe")
		$PowerDown.play()
		emit_signal("entered_pipe")
	
	if not is_on_floor():
		if motion.y < 0:
			$Sprite.play(animations[current_animation_index][2])
			
		else:
			$Sprite.play(animations[current_animation_index][3])
		motion.x = lerp(motion.x, 0, 0.05)
	
	
	
	motion = move_and_slide(motion, UP)
	
	if position.y > 600:
		die()

func down_pole(pole_final_position):
	winner = true
	self.pole_final_position = pole_final_position

func is_falling():
	return motion.y > 0
	
func grow():
	if not is_big:
		$Sprite.position.y -= 8
		current_animation_index = 1
		is_big = true
		$PowerUp.play()

func damage():
	if is_big:
		$Sprite.position.y += 8
		current_animation_index = 0
		is_big = false
		invincible = true
		$AnimationPlayer.play("flashing")
		$PowerDown.play()
		$Invincibility.start()
	else:
		die()

func die():
	if not invincible and is_alive:
		$AnimationPlayer.play("Dead")
		is_alive = false
		$Death.play()
		$AfterDeath.start()
		emit_signal("death")


func _on_Invincibility_timeout():
	invincible = false

func pick_coin():
	Global.coins += 1
	Hud.update_hud()
	$PickCoin.play()
	
func break_block():
	$BreakBlock.play()
func stomp_enemy():
	$StompEnemy.play()

func _on_AfterDeath_timeout():
	get_tree().reload_current_scene()
