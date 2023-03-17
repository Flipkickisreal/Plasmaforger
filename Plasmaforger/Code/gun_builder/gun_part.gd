extends TextureRect
class_name GunPartSprite


#const SHINE_TIME = 2
var data: GunPart
const IMAGESIZE = Vector2 (64,64)
func _ready() -> void:
	#create_tween()
	#(material, "shader_param/shine_progress", 
	#1.0, 0.0, SHINE_TIME, Tween.TRANS_SINE, Tween.EASE_IN)
#	interpolate_value(material, "shader_param/shine_size", 
	#0.13, 0.01, SHINE_TIME * 0.75, Tween.TRANS_CUBIC, Tween.EASE_IN, 
#	SHINE_TIME * .25)
	data = GunPartsLoader.gun_part_classes.pick_random().new()
	texture = data.texture
	size = IMAGESIZE
	expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	stretch_mode = TextureRect.STRETCH_SCALE
	tooltip_text = "%s\nPrice: %s\nRarity: %s" % [data.name, data.price_i, data.Rarity.keys()[data.rarity]]


func _get_drag_data(at_position: Vector2):
	var preview := Control.new()
	preview.modulate.a = 0.5
	var t := TextureRect.new()
	preview.add_child(t)
	t.texture = texture
	t.position = -at_position
	t.size = IMAGESIZE
	set_drag_preview(preview)
	return {
		"part": self,
		"offset": at_position,
	}
