extends Button


# when start button pressed
func _on_pressed() -> void:
	var tween = create_tween()
	var target_position = Vector2(-550, 0)
	
	tween.tween_property($"../..", "position", target_position, 0.7).set_trans(Tween.TRANS_QUART)
	
