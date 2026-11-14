extends Sprite2D

var SPRINGIDLEX = 1
var SPRINGIDLEY = 1

func _physics_process(_delta: float) -> void:
	position.x += SPRINGIDLEX
	if position.x >= 0:
		SPRINGIDLEX -= 0.05
	if position.x <= 1:
		SPRINGIDLEX += 0.05
	position.y += SPRINGIDLEY
	if position.y >= 0:
		SPRINGIDLEY -= 0.05
	if position.y <= 1:
		SPRINGIDLEY += 0.05
