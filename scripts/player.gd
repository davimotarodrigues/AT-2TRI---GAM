extends CharacterBody2D
## Player do jogo de plataforma.

var SPEED: float = 200.0
var JUMP_VELOCITY: float = -400.0
var SUPER_JUMP_VELOCITY: float = -540.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("super_jump") and is_on_floor() and GameManager.power_up:
		GameManager.pode_power_up = true
		velocity.y = SUPER_JUMP_VELOCITY

	var direction: float = Input.get_axis("move_left", "move_right")
	var pode_andar: bool = animated_sprite.sprite_frames.has_animation("run")
	if direction != 0.0 and pode_andar:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	_update_animation(direction, pode_andar)
	move_and_slide()
func brilhar() -> void:
	$Particulas.restart()
func _update_animation(direction: float, pode_andar: bool) -> void:
	if direction != 0.0:
		animated_sprite.flip_h = direction < 0.0

	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction != 0.0 and pode_andar:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
