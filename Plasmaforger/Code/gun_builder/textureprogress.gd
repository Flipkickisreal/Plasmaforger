extends TextureProgressBar

var timeout = false
var valueSetter = 1
const JFCHRIST = 260
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_timer_timerstarted() -> void:
	while timeout == false:
		await get_tree().create_timer(0.0625).timeout
		value = valueSetter
		valueSetter += 1
		print(valueSetter)


func _on_timer_timeout() -> void:
	timeout = true
	valueSetter = 1
	for I in JFCHRIST:
		await get_tree().create_timer(0.0625).timeout
		value = valueSetter
		valueSetter += 1
