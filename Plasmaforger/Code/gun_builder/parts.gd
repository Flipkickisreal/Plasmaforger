extends VBoxContainer


signal part_added(data: GunPart)

const STARTING_PARTS := 8
var rng = RandomNumberGenerator.new()
var loader := GunPartsLoader.new()
func _ready() -> void:
	for i in STARTING_PARTS:
		_make_new_part()


func _can_drop_data(_at_position: Vector2, data) -> bool:
	return (
			data is Dictionary
			and data.has_all(["part","offset"])
			and is_instance_valid(data.part)
			and data.part is GunPartSprite
			and data.offset is Vector2
	)


func _drop_data(at_position: Vector2, data) -> void:
	if not data.part.get_parent() == self:
		part_added.emit(data.part.data)
		data.part.get_parent().remove_child(data.part)
		add_child(data.part)
	for other_child in get_children():
		if other_child == data.part:
			continue
		if other_child.get_rect().end.y > at_position.y:
			move_child(data.part, other_child.get_index())
			return
	move_child(data.part, -1)


func _make_new_part() -> void:
	var part: GunPartSprite = loader.new_gun_part()
	add_child(part)
	move_child(part, -1)


func _on_timer_timeout() -> void:
	var newPartChance = rng.randf_range(-10.0, 10.0)
	if get_child_count() > 2:
		get_child(0).queue_free()
	_make_new_part()
	if newPartChance >= 7:
		_make_new_part()
