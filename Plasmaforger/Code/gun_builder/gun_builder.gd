extends Control


@export var money := 3_000.0


func _ready() -> void:
	%CashMenu.text = str(money)


func _on_settings_pressed() -> void:
	Options.show_options()


func _on_save_load_pressed() -> void:
	SaveLoad.show_save_load(true)


func _on_parts_part_added(data: GunPart) -> void:
	money += data.price_i
	%CashMenu.text = str(money)


func _on_gun_base_part_added(data: GunPart) -> void:
	money -= data.price_i
	%CashMenu.text = str(money)
