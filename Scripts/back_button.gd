extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var tween = create_tween()
	var target_position = Vector2(0, 0)
	
	tween.tween_property($"../../../..", "position", target_position, 0.7).set_trans(Tween.TRANS_QUART)
