extends Control

# ------>
# This mostly adds button hover effects
# ------>
var hover = false
var translate = 50
var maxInit
var initial
var phone

# ------>
# Camera Movement
# ------>
var camera
var moveCamera = false
var moveDir
export var cameraSpeed = 5


func _ready():
	phone = get_node("Phone")
	initial = phone.get_rect().position.y
	maxInit = phone.get_rect().position.y - 50
	
	camera = get_node("../Camera")

func _physics_process(delta):
	# --> Phone Mover
	if(hover and phone.rect_position.y > maxInit):
		phone.rect_position = Vector2(phone.rect_position.x, phone.rect_position.y - delta * 300)
	else:
		if(!hover and phone.rect_position.y < initial):
			phone.rect_position = Vector2(phone.rect_position.x, phone.rect_position.y + delta * 300)
	
	# --> Camera Mover
	if(moveCamera):
		if(moveDir == 'right'):
			camera.translate(Vector3(delta * cameraSpeed, 0, 0))
		elif(moveDir == 'left'):
			camera.translate(Vector3(-delta * cameraSpeed, 0, 0))


func _on_Button_mouse_entered():
	hover = true


func _on_Button_mouse_exited():
	hover = false


# Lets move the camera right
func _on_MoveRight_mouse_entered():
	moveCamera = true
	moveDir = 'right'

# Lets move our camera left
func _on_MoveLeft_mouse_entered():
	moveCamera = true
	moveDir = 'left'

func _on_MoveLeft_mouse_exited():
	moveCamera = false



func _on_MoveRight_mouse_exited():
	moveCamera = false

# Show the large phone
func _on_Phone_pressed():
	get_node('Phone_Big').show()

# Close the phone
func _on_Button_pressed():
	get_node('Phone_Big').hide()
