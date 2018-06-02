extends RigidBody2D

const bullet_types = ["basic"]
var bullet_type


func _ready():
	$AnimatedSprite.animation = bullet_type
	add_collision_exception_with(self)

#func _integrate_forces(s):
#	var lv = s.get_linear_velocity()
#	for i in range(s.get_contact_count()):
#		var cc = s.get_contact_collider_object(i)
#		var dp = s.get_contact_local_normal(i)
#
#		if cc:
#			if cc is foreground_class and not cc.disabled:
#				cc.disable()
#				break
#	s.set_linear_velocity(lv)

func _on_VisibilityEnabler2D_screen_exited():
	queue_free()
