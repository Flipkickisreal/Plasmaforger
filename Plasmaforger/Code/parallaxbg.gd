extends ParallaxBackground
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_hb_cone_dwarfpressed() -> void:
	await get_tree().create_timer(5.0).timeout
	show()
	while get_parent().get_parent().Plasmaplaying == true:
		await get_tree().create_timer(0.1).timeout
		scroll_offset.x += 0.7

func _on_hb_cone_elfpressed() -> void:
	await get_tree().create_timer(5.0).timeout
	show()
	while get_parent().get_parent().Plasmaplaying == true:
		await get_tree().create_timer(0.1).timeout
		scroll_offset.x += 0.7
