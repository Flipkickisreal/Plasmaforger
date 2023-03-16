extends ParallaxBackground
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hb_cone_dwarfpressed() -> void:
	await get_tree().create_timer(5.0).timeout
	show()
	while get_parent().get_parent().Plasmaplaying == true:
		await get_tree().create_timer(0.3).timeout
		scroll_offset.x += 2
