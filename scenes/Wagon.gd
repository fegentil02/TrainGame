extends CharacterBody3D
var t = 0.0

var oldPose = self.position
var oldRot = self.rotation
var wagon

func _ready():
	GlobalVariables.wagon_num += 1
	GlobalVariables.pos_list.append(oldPose)
	GlobalVariables.rotation_list.append(oldRot)
	wagon = GlobalVariables.wagon_num
	pass
func _physics_process(delta):
	#t += delta 
	look_at_from_position(GlobalVariables.pos_list[wagon - 1]  - Vector3(2*sin(GlobalVariables.rotation_list[wagon - 1].y), 0, 2*cos(GlobalVariables.rotation_list[wagon - 1].y)), GlobalVariables.pos_list[wagon - 1] - Vector3(0.5 + 0.5*sin(GlobalVariables.rotation_list[wagon - 1].y), 0, 0.5 + 0.5*cos(GlobalVariables.rotation_list[wagon - 1].y)))
	
	GlobalVariables.pos_list[wagon] = oldPose
	GlobalVariables.rotation_list[wagon] = oldRot
	oldPose = self.position
	oldRot = self.rotation
	pass

