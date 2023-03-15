extends TextureRect


@export var grid_size := Vector2(64, 64)
@export var grid_line_color := Color.GRAY
@export var grid_line_width := 1.0


func _draw() -> void:
	for x in range(0, size.x, grid_size.x):
		draw_line(Vector2(x - grid_line_width / 2, 0), Vector2(x - grid_line_width / 2, size.y), grid_line_color, grid_line_width)
	for y in range(0, size.y, grid_size.y):
		draw_line(Vector2(0, y - grid_line_width / 2), Vector2(size.x, y - grid_line_width / 2), grid_line_color, grid_line_width)


func _can_drop_data(_at_position: Vector2, data) -> bool:
	return data is Dictionary and data.has_all(["part", "offset"]) and data.part is GunPartSprite
	

func _drop_data(at_position: Vector2, data) -> void:
	if not data.part.get_parent() == self:
		data.part.get_parent().remove_child(data.part)
		add_child(data.part)
	data.part.position = (at_position - data.offset).snapped(grid_size)
