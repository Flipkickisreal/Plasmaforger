extends Node


const SPRITES_PATH := "res://sprites/gun_parts/"

var gun_part_classes := [
	# Generations
	Capacitor,
	Dynamo,
	Fusion,
	Transformer,
	# Directs
	Blade,
	Blunt,
	# Firearms
	Barrel,
	FirearmHeatSink,
	FirearmMagazine,
	Receiver,
	# Plasmas
	Condenser,
	Duct,
	Expeller,
	FusionSyphon,
	PlasmaHeatSink,
	Impeller,
	StarScoop,
	# Railguns
	Inducer,
	RailgunMagazine,
	Magnet,
]
var images := []


func _ready() -> void:
	images = get_all_images_in_dir(SPRITES_PATH)


func get_all_images_in_dir(base_path: String) -> Array:
	var dir := DirAccess.open(base_path)
	dir.list_dir_begin()
	var images := []
	var file_name := dir.get_next()
	while not file_name == "":
		if dir.current_is_dir():
			images.append_array(get_all_images_in_dir(base_path + file_name + "/"))
		elif file_name.ends_with(".png.import"):
			images.append(base_path + file_name.replace(".import", ""))
		file_name = dir.get_next()
	dir.list_dir_end()
	return images
