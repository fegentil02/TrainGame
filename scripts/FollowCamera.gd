extends Camera3D

var pos_offset

# Called when the node enters the scene tree for the first time.
func _ready():
	pos_offset = Vector3(position.x - $Head.position.x, position.y - $Head.position.y, position.z - $Head.position.z)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.look_at_from_position($Head.position - pos_offset, $Head.rotation )
	pass
