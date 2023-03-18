extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_hb_cone_dwarfpressed() -> void:
	await get_tree().create_timer(20).timeout
	queue_free()
