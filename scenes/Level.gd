extends Node2D




func _on_Mario_death():
	$Theme.stop()


func _on_Pole_course_clear():
	$Theme.stop()
	$CourseClear.play()
	


func _on_CourseClear_finished():
	Global.level += 1
	Hud.update_hud()
	get_tree().change_scene("res://scenes/Level" + str(Global.level) + ".tscn")
