extends CharacterBody2D

var speed = 100
 
var player_state
 
func _physics_process(delta):
	var direction = Input.get_vector("a", "d", "w", "s")
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	velocity = direction * speed 
	move_and_slide()
	play_anim(direction)
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play('n_walk')
		if dir.x == 1:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("e_walk")
		if dir.y == 1:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("s_walk")
		if dir.x == -1:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play('e_walk')
