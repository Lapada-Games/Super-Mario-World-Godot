extends Node2D

export var delay: float = 1

func _ready():
	$Delay.wait_time = self.delay
	$Delay.start()

func _on_Area2D_body_entered(body):
	if body is Player:
		body.damage()


func _on_Delay_timeout():
	$AnimationPlayer.play("UpAndDown")
