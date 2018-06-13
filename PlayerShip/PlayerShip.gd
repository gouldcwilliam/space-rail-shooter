extends KinematicBody2D

export (int) var SHIP_SPEED = 400
export var SHOT_DELAY = 0.25
export (int) var BULLET_SPEED = 700
export var BULLET_TYPE = "basic"

var velocity = Vector2()
var screensize
var shot_timer = null
var can_shoot = true


func start_shot_timer():
	shot_timer = Timer.new()
	shot_timer.set_one_shot(true)
	shot_timer.set_wait_time(SHOT_DELAY)
	shot_timer.connect("timeout", self, "on_shot_timer_complete")
	add_child(shot_timer)

# When shot timer cooldown finishes
func on_shot_timer_complete():
	can_shoot = true


# gets the input data
func get_input(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if (Input.is_action_pressed("ui_select") && can_shoot):
			shoot()
	if velocity.length() > 0:
		velocity = velocity.normalized() * SHIP_SPEED

	position += velocity * delta
	position.x = clamp(position.x, 50, screensize.x - 50)
	position.y = clamp(position.y, 0, screensize.y)

	if velocity.x != 0:
		if velocity.x < 0:
			$Thruster.rotation_degrees = -65
		elif velocity.x > 0:
			$Thruster.rotation_degrees = 65
	else:
		$Thruster.rotation_degrees = 0


# shoots bullets
func shoot():
	# Creates new bullet using current gun
	var bullet = preload("res://Bullets/Bullet.tscn").instance()
	bullet.position = $GunPosition.global_position
	bullet.linear_velocity = Vector2(BULLET_SPEED, 0)
	bullet.bullet_type = BULLET_TYPE
	bullet.add_collision_exception_with(self)
	get_parent().add_child(bullet)
	$GunSound.play()
	can_shoot = false
	shot_timer.start()


func _ready():
	start_shot_timer()
	screensize = get_viewport_rect().size
	pass


func _physics_process(delta):
	get_input(delta)
	move_and_slide(velocity)
