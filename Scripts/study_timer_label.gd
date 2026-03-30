extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# set Timer node "wait time" to 1500s for 25 min
	
	# 25 min timer done
	if $"../StudyTimer".time_left == 0 and !$"../StudyTimer".autostart:  # check autostart so this only runs once
		$"../StudyTimer".autostart = true  # change autostart simply to only run this tween code once
		var tween : Tween = create_tween()
		var target_pos : Vector2 = Vector2(58, 830)
		
		tween.tween_property($"../../TakeBreakButton", "position", target_pos, 0.7).set_trans(Tween.TRANS_QUART)
		return
	
	# counts down timer
	var time : int = int($"../StudyTimer".time_left)
	var time_text : String
	
	var minutes : String = str((time - (time % 60)) / 60)
	var seconds : String = str(time % 60)
	
	if seconds.length() == 1:
		seconds = "0" + seconds
	
	time_text = minutes + ":" + seconds
	$".".text = time_text
	
	
		
		
