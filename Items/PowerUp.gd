extends Area2D

signal hit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	visible=true
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



func _on_PowerUp_body_entered(body):
	hide()
	queue_free()
	emit_signal("hit")
