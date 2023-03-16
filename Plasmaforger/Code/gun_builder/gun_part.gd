extends TextureRect
class_name GunPartSprite


var data: GunPart


func _ready() -> void:
	data = GunPartsLoader.gun_part_classes.pick_random().new()
	texture = data.texture
	tooltip_text = "%s\nPrice: %s\nRarity: %s" % [data.name, data.price_i, data.Rarity.keys()[data.rarity]]


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
