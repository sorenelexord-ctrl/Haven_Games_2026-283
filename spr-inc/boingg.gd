extends CharacterBody2D

const SPEED = 750.0
const JUMP_VELOCITY = -800.0
const SLOWDOWN = 20
var INSPRING = 0

func _ready() -> void:
	velocity.x = SPEED

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta

	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	if is_on_floor():
		if velocity.x > 0:
			velocity.x -= SLOWDOWN
		if velocity.x < 0:
			velocity.x += SLOWDOWN
	#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_key_pressed(KEY_SPACE) and INSPRING == 1:
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	INSPRING = 1
	print(INSPRING)

func _on_area_2d_body_exited(_body: Node2D) -> void:
	INSPRING = 0
	print(INSPRING)


#func _on_area_2d_body_entered_2(_body: Node2D) -> void:
	#print("stop")
	#velocity.x = 0
	#velocity.y = 0
