extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var powerUpBar_EmptyTexture = preload("res://images/power-level-empty.png")
var powerUpBar_FullTexture = preload("res://images/power-level-full.png")



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _process(delta):
	
	pass

func updatePowerBarLevel( powerBarLevel ):
	if powerBarLevel > 0 :
		$Sprite0.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite0.set_texture(powerUpBar_EmptyTexture)
		
	if powerBarLevel > 1:
		$Sprite1.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite1.set_texture(powerUpBar_EmptyTexture)
		
	if powerBarLevel > 2:
		$Sprite2.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite2.set_texture(powerUpBar_EmptyTexture)
		
	if powerBarLevel > 3:
		$Sprite3.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite3.set_texture(powerUpBar_EmptyTexture)
		
	if powerBarLevel >4:
		$Sprite4.set_texture(powerUpBar_FullTexture)
	else:
		$Sprite4.set_texture(powerUpBar_EmptyTexture)
