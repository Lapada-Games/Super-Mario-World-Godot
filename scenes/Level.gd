extends Node2D




func _on_Mario_death():
	$Theme.stop()


func _on_Pole_course_clear():
	$Theme.stop()
	$CourseClear.play()
	
