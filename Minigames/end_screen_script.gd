extends Node2D


func _ready() -> void:
	var opac_tween = create_tween()
	
	opac_tween.tween_property($Background, "modulate:a", 1, 0.5).set_ease(Tween.EASE_IN_OUT)
	
	
	await get_tree().create_timer(1).timeout 

	var move_tween = create_tween()
	move_tween.tween_property($"Game Over Screen/Loss Screen", "position:x", 0, 1).set_ease(Tween.EASE_IN_OUT)
		


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_manu.tscn")


func _on_keep_studying_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/study_screen.tscn")
	
