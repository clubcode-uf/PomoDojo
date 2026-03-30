extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Generates random minigame from minigame folder
	
	var file_names : Array = DirAccess.get_directories_at("res://Minigames")
	var random_minigame : String = file_names.pick_random()
	var path : String = "res://Minigames/" + random_minigame + "/Scenes/minigame_scene.tscn"
	
	var minigameObj := load(path)
	
	var minigame = minigameObj.instantiate()
	add_child(minigame)
