extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if ! $Music.is_playing():
		$Music.play()
	pass

func _process(delta):
	pass


func _on_Music_finished():
	$Music.play()
	pass # replace with function body
