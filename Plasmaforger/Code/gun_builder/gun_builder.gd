extends Control

@export var GunPartScene: PackedScene


func _ready() -> void:
	for i in 3:
		var g := GunPartScene.instantiate()
		g.texture = load("res://Sprites/Gearicon.png")
		%Parts.add_child(g)


func _on_settings_pressed() -> void:
	Options.show_options()


func _on_save_load_pressed() -> void:
	SaveLoad.show_save_load(true)

