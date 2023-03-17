class_name GunPart
extends Resource


enum Rarity {COMMON, RARE, EPIC, LEGENDARY}

const PRICES := [100.0, 500.0, 1_000.0, 2_000.0]
const SHADER: Array = [
	preload("res://shaders/rarity/common.gdshader"),
	preload("res://shaders/rarity/rare.gdshader"),
	preload("res://shaders/rarity/epic.gdshader"),
	preload("res://shaders/rarity/legendary.gdshader"),
]

@export var name: String
@export var texture: Texture2D
@export var rarity: Rarity
@export var shader: Shader
@export var kelv: float		# temperature
@export var ammo: float		# ammunition
@export var cap: float		# capacitance (resistance to charge drain)
@export var aim: float		# targeting value
@export var hevy: float		# weight
@export var tesla: float	# magnetic interference
@export var impct: float	# kinetic damage
@export var rof: float		# rate of fire
@export var price_i: float	# price to buy
@export var price_m: float	# price to manufacture


func _init(
		p_kelv := 0.0,
		p_ammo := 0.0,
		p_cap := 0.0,
		p_aim := 0.0,
		p_hevy := 0.0,
		p_tesla := 0.0,
		p_impct := 0.0,
		p_rof := 0.0,
		p_price_i := 0.0,
		p_price_m := 0.0,
	) -> void:
	kelv = p_kelv
	ammo = p_ammo
	cap = p_cap
	aim = p_aim
	hevy = p_hevy
	tesla = p_tesla
	impct = p_impct
	rof = p_rof
	price_i = p_price_i
	price_m = p_price_m
	
	rarity = randi() % Rarity.size() as Rarity
	price_i = PRICES[rarity]
	texture = load(GunPartsLoader.images.pick_random())
	shader = SHADER[rarity]
