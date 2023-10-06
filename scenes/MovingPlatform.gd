extends Node2D


export var delay: float = 1

func _ready():
	$Timer.wait_time = delay
	$Timer.start()

func _on_Timer_timeout():
	$AnimationPlayer.play("Moving")
