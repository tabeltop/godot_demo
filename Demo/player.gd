extends Area2D

# Export added the value to the property, enabling easy access/adjustments
@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Set vector 2D to (0,0)
	var velocity = Vector2.ZERO
	# Negative is up for y
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	# Positive is down for y
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	# Move when velocity is not 0
	if velocity.length() > 0:
		# Normalize to ensure same speed diagonally 
		velocity = velocity.normalized() * speed
	# Position of the player is the velocity per frame
	position += velocity * delta
	# Clamp locks the plater to the size of the screen
	position = position.clamp(Vector2.ZERO, screen_size)
