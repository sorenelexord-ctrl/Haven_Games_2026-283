extends StaticBody2D

var SPRINGIDLEX = 0.5
var SPRINGIDLEY = 0.5
@export var playerName: String = "Player"

var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group(playerName)

func _physics_process(_delta: float) -> void:
	#position.x += SPRINGIDLEX
	#if position.x >= 0:
		#SPRINGIDLEX -= 0.01
	#if position.x <= 0.5:
		#SPRINGIDLEX += 0.01
	#position.y += SPRINGIDLEY
	#if position.y >= 0:
		#SPRINGIDLEY -= 0.01
	#if position.y <= 0.5:
		#SPRINGIDLEY += 0.01
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if player:
		player.INSPRING = 13
		player.velocity.y *= 0.2
		player.velocity.y += player.JUMP_VELOCITY*1.5


func _on_area_2d_body_exited(body: Node2D) -> void:
	if player:
		player.INSPRING = 0
