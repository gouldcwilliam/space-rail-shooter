extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var POWERUPBARLEVEL = 0
var powerUpBar_EmptyTexture = preload("res://images/power-level-empty.png")
var powerUpBar_FullTexture = preload("res://images/power-level-full.png")



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _process(delta):
	if Input.is_key_pressed(KEY_T):
		POWERUPBARLEVEL+=1
	if Input.is_key_pressed(KEY_Y):
		POWERUPBARLEVEL-=1
	updatePowerBarLevel()
	pass

func updatePowerBarLevel():
	if POWERUPBARLEVEL > 0 :
		$Sprite0.set_texture(powerUpBar_FullTexture)
#	elif POWERUPBARLEVEL == 0:
#		$Sprite0.set_texture(powerUpBar_EmptyTexture)
	else:
		$Sprite0.set_texture(powerUpBar_EmptyTexture)
		
	if POWERUPBARLEVEL > 1:
		$Sprite1.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite1.set_texture(powerUpBar_EmptyTexture)
		
	if POWERUPBARLEVEL > 2:
		$Sprite2.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite2.set_texture(powerUpBar_EmptyTexture)
		
	if POWERUPBARLEVEL > 3:
		$Sprite3.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite3.set_texture(powerUpBar_EmptyTexture)
		
	if POWERUPBARLEVEL >4:
		$Sprite4.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite4.set_texture(powerUpBar_EmptyTexture)
