extends KinematicBody2D

#const ACCELERATION = 100
#const MAX_SPEED = 200
#const FRICTION = 200
var arrastrar = true
export(float) var fuerza_mover
#var Velocidad = Vector2.ZERO

onready var animated_sprite : AnimatedSprite = $AnimatedSprite
export var move_speed: = 200
export var push_speed : = 100

func _physics_process(delta: float) -> void:
	var motion: = Vector2() #reiniciar el valor
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	#------------------Arrastrar------------------------
	if (Input.is_action_just_pressed("Arrastar")):
		$AnimatedSprite.play("Arrastrar")
		arrastrar = false
		#__________________________
	
	update_animation(motion)
	move_and_slide(motion.normalized() * move_speed, Vector2())
	if get_slide_count() >0:
		check_box_collision(motion)
	get_tree().get_nodes_in_group("Pasos")
	
func update_animation(motion:Vector2) -> void:
	var animation = "Frente"
	if motion.x > 0:
		animation ="Lado Der"
	elif motion.x < 0:
		animation = "Lado Izq"
	elif motion.y < 0:
		animation ="Arriba"
	elif motion.y > 0:
		animation = "Abajo"
		

		
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)
	
	#-----------------mover cajas-----------
	
func check_box_collision(motion : Vector2) -> void:
	if abs(motion.x) + abs(motion.y) > 1:
		return
	var box: = get_slide_collision(0).collider as Box
	if box:
		box.push(push_speed * motion)
		
		
	
	#-----------------------------------------
	
	if(get_slide_collision(get_slide_count()-1)!= null):
		var obj_col =get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Ratas")):
			queue_free()



