extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var powerBarLevel = 0

func _ready():
	test_PowerUps()
	test_Enemies()
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
	
func _on_EnemyHit(body):
	var powerUp = preload("res://Items/PowerUp.tscn").instance()
	add_child(powerUp)
	powerUp.position = body.position
	powerUp.connect("hit", self, "_on_PowerUp")

func test_PowerUps():
	var powerUp1 = preload("res://Items/PowerUp.tscn").instance()
	var powerUp2 = preload("res://Items/PowerUp.tscn").instance()
	add_child(powerUp1)
	add_child(powerUp2)
	powerUp1.connect("hit", self, "_on_PowerUp")
	powerUp2.connect("hit", self, "_on_PowerUp")
	powerUp1.position = Vector2(700, 300)
	powerUp2.position = Vector2(800, 100)
	
func test_Enemies():
	var enemy1 = preload("res://Enemies/BasicEnemy1.tscn").instance()
	add_child(enemy1)
	enemy1.connect("hit", self, "_on_EnemyHit")
	enemy1.position = Vector2(600, 200)

