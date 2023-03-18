extends TextureRect
class_name GunPartSprite


#const SHINE_TIME = 2
var data: GunPart
var tween : Tween
var tween_value: float
const IMAGESIZE = Vector2 (64,64)

func _init(p_data: GunPart) -> void:
	data = p_data
	texture = data.texture
	material = ShaderMaterial.new()
	material.shader = data.shader
	size = IMAGESIZE
	expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
	stretch_mode = TextureRect.STRETCH_SCALE
	tooltip_text = "%s\nPrice: %s\nRarity: %s" % [data.name, data.mod_price, data.Rarity.keys()[data.rarity]]


func _ready() -> void:
	if data.rarity >= data.Rarity.RARE:
		_tween_shader()


func _process(_delta):
	material.set_shader_parameter("shine_progress", tween_value)


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


func _tween_shader() -> void:
	tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "tween_value", 0.0, 2.0).from(1.0)
#	tween.interpolate_property(sprite.material, "shader_param/shine_progress", 
#	1.0, 0.0, SHINE_TIME, Tween.TRANS_SINE, Tween.EASE_IN)
#	tween.interpolate_property(sprite.material, "shader_param/shine_size", 
#	0.13, 0.01, SHINE_TIME * 0.75, Tween.TRANS_CUBIC, Tween.EASE_IN, 
#	SHINE_TIME * .25)
#
#	tween.interpolate_property(sprite.material, "shader_param/shine_progress", 
#	0.0, 1.0, SHINE_TIME, Tween.TRANS_SINE, Tween.EASE_OUT, SHINE_TIME)
#	tween.interpolate_property(sprite.material, "shader_param/shine_size", 
#	null, 0.13, SHINE_TIME * 0.75, Tween.TRANS_CUBIC, Tween.EASE_OUT, 
#	SHINE_TIME * .25 + SHINE_TIME)

