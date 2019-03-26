extends KinematicBody2D

const UP = Vector2(0,-1)
export var acceleration = 50
export var max_speed = 200
export var gravity = 20
export var jump_height = -500

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + acceleration, max_speed)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_height
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
	
	motion = move_and_slide(motion, UP)