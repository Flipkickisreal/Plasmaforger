class_name GunPartsLoader
extends Node


const SPRITES_PATH := "res://Sprites/gun_parts/finished_parts/"

var gun_part_classes := [
	# Vision
	#placeholder
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
@export var images: Array


func _init() -> void:
	var images_paths = get_all_images_in_dir(SPRITES_PATH)
	for image in images_paths:
		images.append(load(image))


func get_all_images_in_dir(base_path: String) -> Array:
	var dir := DirAccess.open(base_path)
	dir.list_dir_begin()
	var results := []
	var file_name := dir.get_next()
	while not file_name == "":
		if dir.current_is_dir():
			results.append_array(get_all_images_in_dir(base_path + file_name + "/"))
		elif file_name.ends_with(".png.import"):
			results.append(base_path + file_name.replace(".import", ""))
		file_name = dir.get_next()
	dir.list_dir_end()
	return results


func new_gun_part() -> GunPartSprite:
	var part_class: GDScript = gun_part_classes.pick_random()
	var image: Resource = images.pick_random()
	var part = part_class.new(image)
	var scene = GunPartSprite.new(part)
	return scene


	#func get_all_shaders_in_dir(base_path: String) -> Array:
		#var shadedir := DirAccess.open(base_path)
		#shadedir.list_dir_begin()
		#var shade_results := []
		#var shade_file_name := shadedir.get_next()
		#while not shade_file_name == "":
		#	if shadedir.current_is_dir():
#				shade_results.append_array(get_all_shaders_in_dir(base_path + shade_file_name + "/"))
#			shade_file_name = shadedir.get_next()
#		shadedir.list_dir_end()
#		return shade_results
#		print(shade_results)
