extends TextureRect
class_name GunPart


func _get_drag_data(_at_position: Vector2):
	var preview := duplicate()
	preview.size = Vector2.ZERO
	preview.modulate.a = 0.5
	set_drag_preview(preview)
	return self
