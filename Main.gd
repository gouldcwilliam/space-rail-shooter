extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var powerBarLevel = 0

func _ready():
	pass

func _physics_process(delta):
	$"Lvl1-Obstacles".position = Vector2($"Lvl1-Obstacles".position.x -0.5, $"Lvl1-Obstacles".position.y)
	$SpaceBackground.offset = Vector2($SpaceBackground.offset.x -.5, $SpaceBackground.offset.y)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_T):
		powerBarLevel+=1
		$HUD.updatePowerBarLevel(powerBarLevel)
	if Input.is_key_pressed(KEY_Y):
		powerBarLevel-=1
		$HUD.updatePowerBarLevel(powerBarLevel)
		
	pass


func _on_PowerUp():
	powerBarLevel += 1
	$HUD.updatePowerBarLevel(powerBarLevel)



