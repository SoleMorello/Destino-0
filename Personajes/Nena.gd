extends Area2D


var can_interact = false
const DIALOG = preload("res://Accesorios/DialogoBox.tscn")

func _physics_process(delta):
	$AnimatedSprite.play()
	
	
#icono de interaccion
func _on_Nena_body_entered(body): 
	if body.name == "Player":
		$Label.visible = true
		can_interact = true
	
	


func _on_Nena_body_exited(body):
	if body.name == "Player":
		$Laber.visible = false
		can_interact = false
		
func _input(event): #Presionar el boton
	if Input. is_key_pressed(KEY_E) and can_interact == true:
		$Label.visible = false
		var dialog = DIALOG.instance()
		get_parent().add_child(dialog)
