extends Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# 5 min timer done
	if $"../BreakTimer".time_left == 0 and !$"../BreakTimer".autostart:  # check autostart so this only runs once
		$"../BreakTimer".autostart = true  # change autostart simply to only run this tween code once
		
		for node in $"../..".get_children():
			if node.has_method("lose"):
				node.lose()
	
	# counts down timer
	var time : int = int($"../BreakTimer".time_left)
	var time_text : String
	
	var minutes : String = str((time - (time % 60)) / 60)
	var seconds : String = str(time % 60)
	
	if seconds.length() == 1:
		seconds = "0" + seconds
	
	time_text = minutes + ":" + seconds
	$".".text = time_text
	
