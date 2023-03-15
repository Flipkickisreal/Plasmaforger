extends Resource
class_name GunPart


@export var KELV: float #tempurature
@export var AMMO: float #ammunition
@export var CAP: float #capacitance (resistance to charge drain)
@export var AIM: float #targeting value
@export var HEVY: float #weight
@export var TESLA: float #magnetic interferance
@export var IMPCT: float #kinetic damage
@export var ROF: float #rate of fire
@export var IPRICE: float #price to buy
@export var MPRICE: float #price to manufacture

func _init(Init_KELV = 0, Init_AMMO = 0, Init_CAP = 0, Init_AIM = 0, Init_HEVY = 0, Init_TESLA = 0, Init_IMPCT = 0, Init_ROF = 0, Init_IPRICE = 0, Init_MPRICE = 0) -> void:
		KELV = Init_KELV
		AMMO = Init_AMMO
		CAP = Init_CAP
		AIM = Init_AIM
		HEVY = Init_HEVY
		TESLA = Init_TESLA
		IMPCT = Init_IMPCT
		ROF = Init_ROF
		IPRICE = Init_IPRICE
		MPRICE = Init_MPRICE
