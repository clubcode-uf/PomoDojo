extends Node2D

var fruitObj = preload("res://Minigames/Fruit Merge/Scenes/fruit.tscn")
var fruit_spawned = false  # var for checking if only one object is able to be selected
var selected_fruit = null

var smallest_radius = 30
var smallest_scale = 0.075
var radius_scale_diff = 1.175
var score = 0
var game_over = false

var fruit_spawn_height = 250
var left_barrier = 55
var right_barrier = 525

var new_fruit_load_time : float = 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ScoreContainer/Score.text = "Score: " + str(score)
	
	if game_over:
		return
	if !fruit_spawned:  # creates single fruit to be dropped
		var fruit = fruitObj.instantiate()
		var random_scaling = 0
		random_scaling = radius_scale_diff ** randi_range(0, 4)
		fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius = smallest_radius * random_scaling
		fruit.get_node("RigidBody2D/Sprite2D").scale = Vector2(smallest_scale * random_scaling, smallest_scale * random_scaling)
		
		var mouse_pos_x = get_viewport().get_mouse_position()[0]
		var fruit_rad = snapped(fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1)
			
		if mouse_pos_x <= left_barrier + fruit_rad:
			mouse_pos_x = left_barrier + 1 + fruit_rad
		elif mouse_pos_x >= right_barrier - fruit_rad:
			mouse_pos_x = right_barrier - fruit_rad
		fruit.get_node("RigidBody2D").position = Vector2(mouse_pos_x, fruit_spawn_height)
		
		fruit.set_fruit_image(smallest_radius, smallest_scale, radius_scale_diff)
		
		add_child(fruit)
		selected_fruit = fruit
		fruit_spawned = true
	
	if selected_fruit != null and selected_fruit.get_node("RigidBody2D").freeze:  # freezes fruit in air and follows mouse
		var mouse_pos_x = get_viewport().get_mouse_position()[0]
		var fruit_rad = snapped(selected_fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1)
		if mouse_pos_x > left_barrier - 1 + fruit_rad and mouse_pos_x < right_barrier + 1 - fruit_rad:
			selected_fruit.get_node("RigidBody2D").position = Vector2(mouse_pos_x, fruit_spawn_height)
			
	if selected_fruit != null:
		if Input.is_action_just_pressed("mouse") and selected_fruit.get_node("RigidBody2D").freeze:  # sets fruit position to whereever you click (enables just clicking for positioning)
			var mouse_pos_x = get_viewport().get_mouse_position()[0]
			var fruit_rad = snapped(selected_fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1)
				
			if mouse_pos_x <= left_barrier + fruit_rad:
				mouse_pos_x = left_barrier + 1 + fruit_rad
			elif mouse_pos_x >= right_barrier - fruit_rad:
				mouse_pos_x = right_barrier - fruit_rad
			selected_fruit.get_node("RigidBody2D").position = Vector2(mouse_pos_x, fruit_spawn_height)
		
	if selected_fruit != null:
		if Input.is_action_just_released("mouse") and selected_fruit.get_node("RigidBody2D").freeze:  # lets fruit fall
			score += snapped(selected_fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1)
			selected_fruit.get_node("RigidBody2D").freeze = false
			selected_fruit.get_node("RigidBody2D/CollisionShape2D").set_deferred("disabled", false)
			await get_tree().create_timer(new_fruit_load_time).timeout
			fruit_spawned = false
		
	# check for 2 fruits that have collided
	var collided_fruits = []
	for child in get_children():  # checks for fruit nodes
		if child is Node2D:
			for child_child in child.get_children():
				if child_child is RigidBody2D:
					if child.has_collided:
						collided_fruits.append(child)
	if len(collided_fruits) != 0:
		var size = collided_fruits[0].get_node("RigidBody2D/CollisionShape2D").shape.radius
		
		var avg_x = 0
		var avg_y = 0
		for i in range(len(collided_fruits)):
			avg_x += collided_fruits[i].get_node("RigidBody2D").position[0]
			avg_y += collided_fruits[i].get_node("RigidBody2D").position[1]
		avg_x /= len(collided_fruits)
		avg_y /= len(collided_fruits)
		var pos = Vector2(avg_x, collided_fruits[0].get_node("RigidBody2D").position[1])  # sets new fruit position to average position of combined fruits
		
		for i in range(1, 3):
			collided_fruits[len(collided_fruits)-i].queue_free()
			#selected_fruit = null
		for i in range(0, len(collided_fruits)-2):
			collided_fruits[i].has_collided = false
		collided_fruits = []
		create_merged_fruit(size, pos)
			
			
func create_merged_fruit(old_size, old_pos):
	var fruit = fruitObj.instantiate()
	fruit.get_node("RigidBody2D").position = old_pos
	fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius = old_size * radius_scale_diff
	fruit.get_node("RigidBody2D/Sprite2D").scale = Vector2((smallest_scale / smallest_radius) * old_size*radius_scale_diff, (smallest_scale / smallest_radius) * old_size*radius_scale_diff)
	
	fruit.set_fruit_image(smallest_radius, smallest_scale, radius_scale_diff)
	
	fruit.get_node("RigidBody2D").freeze = false
	fruit.get_node("RigidBody2D/CollisionShape2D").set_deferred("disabled", false)
	
	add_child(fruit)
	score += snapped(fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1)
	
	# win trigger for standalone minigame
	"""
	if snapped(fruit.get_node("RigidBody2D/CollisionShape2D").shape.radius, 1) == snapped(smallest_radius * (radius_scale_diff ** 10), 1):
		if !game_over:
			win()
	"""

func _on_death_plane_entered(body: Node2D) -> void:
	if !game_over:
		pass
		###TODO: make this take away score
		

# YOU CAN NEVER WIN HAHAAHA
"""func win():
	game_over = true
	await get_tree().create_timer(1).timeout 
	var opac_tween = create_tween()
	opac_tween.tween_property($"Win or Loss Screen/Background", "modulate:a", 0.75, 0.5).set_ease(Tween.EASE_IN_OUT)
		
	await get_tree().create_timer(1).timeout 

	var move_tween = create_tween()
	move_tween.tween_property($"Win or Loss Screen/Win Screen", "position:x", 0, 1).set_ease(Tween.EASE_IN_OUT)
"""
	
	
# THIS LOSE FUNCTION MUST BE IN EVERY MINIGAME
func lose():
	game_over = true
	
	var end_screen_Obj = load("res://Minigames/end_screen.tscn")
	var end_screen = end_screen_Obj.instantiate()
	add_child(end_screen)
	
