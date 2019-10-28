extends KinematicBody
export var rotspeed = 1.0
export var movespeed = 1.0
export var gravity = -12  # strength of gravity Vector3.DOWN * 12
export var speed = 4  # movement speed



var velocity = Vector3()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	set_process(true) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	velocity.z = 0	
	#print("delta", delta)
	if Input.is_action_pressed("strafe_left"):
		print("strafe_left")
		#self.rotate_z(rotspeed*delta)
		#self.rotate_object_local(Vector3(0,0,1), PI*delta)
		#print(self.transform)
		#print(self.rotation.z)
		#print(self.get_property_list())
		var r = get_rotation()
		r += Vector3(0,0,1) * delta
		set_rotation(r)
		#print("changed z")
		#print("scale:",self.scale)
		#self.scale = Vector3(1,1,0.5)
	if Input.is_action_pressed("strafe_right"):
		print("strafe_right")
		self.rotate_z(rotspeed*delta*-1.0)
		print(self.transform)
	if Input.is_action_pressed("rotate_x_left"):
		self.rotate_x(rotspeed*delta)
	if Input.is_action_pressed("rotate_x_right"):
		self.rotate_x(rotspeed*delta*-1.0)
	if Input.is_action_pressed("rotate_y_left"):
		self.rotate_y(rotspeed*delta)
	if Input.is_action_pressed("rotate_y_right"):
		self.rotate_y(rotspeed*delta*-1.0)
	if Input.is_action_pressed("move_forward"):
		velocity.z -= speed
	if Input.is_action_pressed("move_backward"):
		velocity.z += speed
	if Input.is_action_pressed("move_left"):
		#print("move_left")
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		#print("move_right")
		velocity.x += speed
		
func _physics_process(delta):
	_process(delta)
	velocity = move_and_slide(velocity, Vector3.UP)