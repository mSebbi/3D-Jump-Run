extends KinematicBody

const MOUS_SENSIVITY = 0.3



func _process(delta):
	window_activity()


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)



#Alles was mit der Kamera zu tun hat
func _input(event):
	if event is InputEventMouseMotion:
		
		$CamRoot.rotate_x(deg2rad(event.relative.y * -1))
		
		self.rotate_y(deg2rad(event.relative.x * MOUS_SENSIVITY * -1))
		$CamRoot.rotation_degrees.x = clamp($CamRoot.rotation_degrees.x,-75 , 75)
		
		

func _physics_process(delta):
	pass

#Um die Maus zu zeigen oder zu verstecken
func window_activity():
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
