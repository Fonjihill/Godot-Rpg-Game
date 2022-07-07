extends KinematicBody2D


const ACCELERATION = 500 #Acceleration is the change of the velocity over the time
const MAX_SPEED = 100
const FRICTION = 500 #Not different to th Acceleration
var velocity = Vector2.ZERO # the velocity change over the time depending to the frame

func _physics_process(delta): #To move the player
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	print(input_vector)
	
	if input_vector != Vector2.ZERO:
		velocity =velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	
	
	velocity = move_and_slide(velocity)
	
	print(velocity)
