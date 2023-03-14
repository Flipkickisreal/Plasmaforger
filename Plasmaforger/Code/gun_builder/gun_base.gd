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
	return data is GunPartSprite
	

func _drop_data(at_position: Vector2, data) -> void:
	if not data.get_parent() == self:
		data.get_parent().remove_child(data)
		add_child(data)
		data.size = Vector2.ZERO
	data.position = at_position.snapped(grid_size)
