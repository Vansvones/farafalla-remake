extends Area2D

var speed := 200
@export var acceleration := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		
	if velocity.x != 0 and velocity.y == 0:
		$AnimatedSprite2D.play('walk')
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y > 0:
		$AnimatedSprite2D.play('fall')
	elif velocity.y < 0:
		$AnimatedSprite2D.play('jump')
	else:
		$AnimatedSprite2D.play('idle')
	
	position += velocity * speed * delta
