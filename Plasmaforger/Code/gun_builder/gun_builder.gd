extends Control

signal gamestarted
signal dwarf
signal elf
@export var money := 3_000.0


func _ready() -> void:
	%CashMenu.text = str(money)


func _on_settings_pressed() -> void:
	Options.show_options()


func _on_save_load_pressed() -> void:
	SaveLoad.show_save_load(true)


func _on_parts_part_added(data: GunPart) -> void:
	money += data.mod_price
	%CashMenu.text = str(money)


func _on_gun_base_part_added(data: GunPart) -> void:
	money -= data.mod_price
	%CashMenu.text = str(money)


func _on_hb_cone_anythingpressed() -> void:
	emit_signal("gamestarted")


func _on_hb_cone_dwarfpressed() -> void:
	emit_signal("dwarf")


func _on_hb_cone_elfpressed() -> void:
	emit_signal("elf")
