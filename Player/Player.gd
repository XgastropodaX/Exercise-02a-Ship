extends KinematicBody2D

var velocity = Vector2.ZERO
var rotation_speed = 4.0
var speed = 0.1
var max_speed = 10


func _physics_process(_delta):
	position = position + velocity
	$exhaust.hide()
	velocity = velocity.normalized() * clamp(velocity.length() ,0, max_speed)
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotation_speed	
	if Input.is_action_pressed("forward"):
		$exhaust.show()
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
	if Input.is_action_pressed("backwards"):
		velocity = velocity + Vector2(0,+speed).rotated(rotation)
	
	position.x = wrapf(position.x,0,1024)
	position.y = wrapf(position.y,600,0)
	
