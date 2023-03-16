extends Control


const TEST_PARTS := [
	preload("res://resources/gun_parts/test_part_0.tres"),
	preload("res://resources/gun_parts/test_part_1.tres"),
	preload("res://resources/gun_parts/test_part_2.tres"),
	preload("res://resources/gun_parts/test_part_3.tres"),
	preload("res://resources/gun_parts/test_part_4.tres"),
	preload("res://resources/gun_parts/test_part_5.tres"),
	preload("res://resources/gun_parts/test_part_6.tres"),
	preload("res://resources/gun_parts/test_part_7.tres"),
	preload("res://resources/gun_parts/test_part_8.tres"),
	preload("res://resources/gun_parts/test_part_9.tres"),
]

@export var _GunPartSpriteScene: PackedScene
@export var money := 3_000.0


func _ready() -> void:
	for i in 5:
		var part: GunPart = TEST_PARTS.pick_random()
		var scene := _GunPartSpriteScene.instantiate()
		scene.init(part)
		%Parts.add_child(scene)
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
