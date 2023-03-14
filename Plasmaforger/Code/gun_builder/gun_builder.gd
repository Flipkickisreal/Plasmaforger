extends Control


@export var GunPart: PackedScene


func _ready() -> void:
	for i in 3:
		var g := GunPart.instantiate()
		g.texture = load("res://icon.svg")
		$HBoxContainer/Left/VBox/Scroll/Parts.add_child(g)
