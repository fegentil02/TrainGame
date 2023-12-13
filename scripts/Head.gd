extends CharacterBody3D

var coal
var oldPose = self.position
var oldRot = self.rotation
var t = 0.0
func _ready():
	GlobalVariables.pos_list.append(oldPose)
	GlobalVariables.rotation_list.append(oldRot)
	coal = get_node("Train/Carvão")
func _physics_process(delta):
	#Train always goes forward, turns and jumps with player input
	#t += delta
	if Input.is_action_pressed("jump"):
		var scene = coal.instantiate()
		add_child(scene)
	if Input.is_action_pressed("turn_left"):
		self.rotate_object_local(Vector3(0, 1, 0), 0.01)
	elif Input.is_action_pressed("turn_right"):
		self.rotate_object_local(Vector3(0,1,0), -0.01)
	
	
	velocity = Vector3(sin(rotation.y), 0, cos(rotation.y))
	move_and_slide()
	
	GlobalVariables.pos_list[0] = oldPose
	GlobalVariables.rotation_list[0] = oldRot
	oldPose = self.position
	oldRot = self.rotation
