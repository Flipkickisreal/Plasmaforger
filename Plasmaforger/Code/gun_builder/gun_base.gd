extends TextureRect


signal part_added(data: GunPart)

@export var grid_size := Vector2(64, 64)
@export var grid_line_color := Color.GRAY
@export var grid_line_width := 3.0


func _draw() -> void:
	for x in range(0, size.x, grid_size.x):
		draw_line(Vector2(x - grid_line_width / 2, 0), Vector2(x - grid_line_width / 2, size.y), grid_line_color, grid_line_width)
	for y in range(0, size.y, grid_size.y):
		draw_line(Vector2(0, y - grid_line_width / 2), Vector2(size.x, y - grid_line_width / 2), grid_line_color, grid_line_width)


func _can_drop_data(_at_position: Vector2, data) -> bool:
	return (
			data is Dictionary
			and data.has_all(["part", "offset"])
			and data.offset is Vector2
			and is_instance_valid(data.part)
			and data.part is GunPartSprite
			and (owner.money >= data.part.data.mod_price or data.part.get_parent() == self)
			and not _is_part_overlapping(data)
	)


func _drop_data(at_position: Vector2, data) -> void:
	if not data.part.get_parent() == self:
		part_added.emit(data.part.data)
		data.part.get_parent().remove_child(data.part)
		add_child(data.part)
	data.part.position = ((at_position) / grid_size).floor() * grid_size


func _is_part_overlapping(data: Dictionary) -> bool:
	var place_rect := data.part.get_global_rect() as Rect2
	place_rect.position = get_global_mouse_position() - data.offset
	for other_part in get_children():
		if not other_part == data.part and other_part.get_global_rect().intersects(place_rect):
			return true
	return false
