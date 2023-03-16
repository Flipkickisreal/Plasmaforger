extends Label
var money = 3000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(money)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func transact() -> void:
	pass


func _on_parts_parts_changed() -> void:
	var addtomoney = %Parts.changetomoney
	money += addtomoney
	text = str(money)
	


func _on_gun_base_basechanged() -> void:
	var removemoney = $"../../../../GunBase".gb_changetomoney
	money -= removemoney
	text = str(money)
