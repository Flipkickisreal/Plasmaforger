extends Timer
signal timerstarted
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_gun_builder_gamestarted() -> void:
	await get_tree().create_timer(30).timeout
	emit_signal("timerstarted")
	start(15)
