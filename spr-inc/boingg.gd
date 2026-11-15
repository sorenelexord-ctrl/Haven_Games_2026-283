extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const SLOWDOWN = 20
var INSPRING = 0

var startPos: Vector2

func _ready() -> void:
	startPos = position
	velocity.x = SPEED

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#if is_on_floor():
	#	if velocity.x > 0:
	#		velocity.x -= SLOWDOWN
	#	if velocity.x < 0:
	#		velocity.x += SLOWDOWN
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_key_pressed(KEY_SPACE) and INSPRING == 1:
		velocity.y = JUMP_VELOCITY
	
	#if position.y > 1000:
		#position = startPos
		#get_tree().change_scene_to_file("res://test.tscn")

	move_and_slide()


#func _on_area_2d_body_entered(_body: Node2D) -> void:
	#INSPRING = 13
	#velocity.y *= 0.2
	#velocity.y += JUMP_VELOCITY
	#print(INSPRING)
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#INSPRING = 0
	#print(INSPRING)


func _on_death_zone_body_entered(_body: Node2D) -> void:
	position = startPos


func _on_area_2d_body_entered(body: Node2D) -> void:
	print ("You Have Completed The Challenge...")
