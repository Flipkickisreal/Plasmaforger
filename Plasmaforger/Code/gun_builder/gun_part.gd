extends TextureRect
class_name GunPartSprite

func _get_drag_data(at_position: Vector2):
	var preview := Control.new()
	preview.modulate.a = 0.5
	var t := TextureRect.new()
	preview.add_child(t)
	t.texture = texture
	t.position = -at_position
	set_drag_preview(preview)
	return {
		"part": self,
		"offset": at_position,
	}
