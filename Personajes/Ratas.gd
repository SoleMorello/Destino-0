extends KinematicBody2D


var speed = 50
var motion = Vector2.ZERO
#var goForeward = true
var Player = null

func _physics_process(delta):
	
	motion = Vector2.ZERO
	if Player:
		$AnimatedSprite.play("Ratas")
		$AnimatedSprite. flip_h = false
		motion = position.direction_to(Player.position) * speed
	motion = move_and_slide(motion)
	
	if(get_slide_collision(get_slide_count()-1)!= null):
		var obj_col =get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Player")):
			pass
	
	#if is_on_wall(): #choque paredes
	#	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	#	goForeward = not goForeward


func _on_Area2D_body_entered(body):
	Player = body


func _on_Area2D_body_exited(body):
	Player = null


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().reload_current_scene()
