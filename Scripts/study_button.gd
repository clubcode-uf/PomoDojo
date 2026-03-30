extends Button


# when study button pressed
func _on_pressed() -> void:
	var tween = create_tween()
	var target_position = Vector2(-1100, 0)
	
	tween.tween_property($"../..", "position", target_position, 0.7).set_trans(Tween.TRANS_QUART)
	await get_tree().create_timer(0.7).timeout
	
	get_tree().change_scene_to_file("res://Scenes/study_screen.tscn")
