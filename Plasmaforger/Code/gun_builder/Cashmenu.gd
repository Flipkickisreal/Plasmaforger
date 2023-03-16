extends Label
var money = 1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = str(money)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func transact() -> void:
	pass


func _on_parts_parts_changed() -> void:
	var addtomoney = %Parts.changetomoney
	money += addtomoney
	self.text = str(money)
	money -= addtomoney
	
