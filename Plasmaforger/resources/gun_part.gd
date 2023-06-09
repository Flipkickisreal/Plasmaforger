class_name GunPart
extends Resource


enum Rarity {COMMON, RARE, EPIC, LEGENDARY}

var pricerng = RandomNumberGenerator.new()

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
var price_i: float	# price to buy
@export var price_m: float	# price to manufacture
@export var mod_price: float #price_i but modified, whatever...
var part_class

func _init(
		p_texture: Resource,
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
		p_mod_price := 350,
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
	mod_price = p_mod_price
	
	rarity = randi() % Rarity.size() as Rarity
	price_i = PRICES[rarity]
	texture = p_texture
	shader = SHADER[rarity]
	var mod_preprice = price_i * pricerng.randf_range(0.60, 1.27)
	mod_price = round(mod_preprice)

