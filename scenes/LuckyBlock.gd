extends StaticBody2D

var hit = false
var enemy = preload("res://scenes/Mushroom.tscn")

export var has_mushroom = false

func _on_Impact_body_entered(body):
	if not hit:
		$AnimationPlayer.play("Bateu")
		hit = true
		if has_mushroom:
			$Coin.visible = false
			var instance = enemy.instance()
			instance.position.y = -40
			add_child(instance)
			$PowerUpAppears.play()
		else:
			body.pick_coin()
