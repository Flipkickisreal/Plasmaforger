extends TextureRect
class_name GunPartSprite


var data: GunPart


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


func init(d: GunPart) -> void:
	data = d
	texture = d.texture
	tooltip_text = "%s\nPrice: %s\nRarity: %s" % [d.name, d.price_i, d.Rarity.keys()[d.rarity]]
