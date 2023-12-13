extends CharacterBody3D


func _ready():
	GlobalVariables.pos_list.append(self.position)
	
func _physics_process(_delta):
	#Train always goes forward, turns and jumps with player input
	
	if Input.is_action_pressed("turn_left"):
		self.rotate_object_local(Vector3(0, 1, 0), 0.01)
	elif Input.is_action_pressed("turn_right"):
		self.rotate_object_local(Vector3(0,1,0), -0.01)
	
	
	velocity = Vector3(sin(rotation.y), 0, cos(rotation.y))
	move_and_slide()
	GlobalVariables.pos_list[0] = self.position
	
