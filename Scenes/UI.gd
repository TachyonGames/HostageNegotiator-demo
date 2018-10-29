extends Control

# ------>
# This mostly adds button hover effects
# ------>

var hover = false
var translate = 50
var maxInit
var initial

var phone
func _ready():
	phone = get_node("Button")
	initial = phone.get_rect().position.y
	maxInit = phone.get_rect().position.y - 50

func _physics_process(delta):
	if(hover and phone.rect_position.y > maxInit):
		phone.rect_position = Vector2(phone.rect_position.x, phone.rect_position.y - delta * 300)
	else:
		if(!hover and phone.rect_position.y < initial):
			phone.rect_position = Vector2(phone.rect_position.x, phone.rect_position.y + delta * 300)

func _on_Button_mouse_entered():
	hover = true


func _on_Button_mouse_exited():
	hover = false
