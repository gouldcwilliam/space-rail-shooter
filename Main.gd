extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var score

func _ready():
	pass

func _physics_process(delta):
	$"Lvl1-Obstacles".position = Vector2($"Lvl1-Obstacles".position.x -1, $"Lvl1-Obstacles".position.y)
	$SpaceBackground.offset = Vector2($SpaceBackground.offset.x -.5, $SpaceBackground.offset.y)
	pass
