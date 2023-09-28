extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("move_left"):
		velocity.x += -1
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	velocity.normalized()
	velocity *= 75
	self.move_and_slide()
