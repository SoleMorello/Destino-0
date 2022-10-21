 extends Control


var dialogo = [
	"Hasta que porfin despiertas muchacho", #abuelo 
	#"Eh..eh..¿En dónde estoy?", #usuario
	"El subte ya acabó su recorrido ¿Cuál era tu destino final?", #abuelo
	"No consigo recordar, no sé cómo terminé acá", #usuario
	"¿Recuerdas tu nombre?",  #abuelo
	"Lautaro", #usuario
	"Ahhh, Lautaro, mucho gusto, yo me llamo Arsenio. Mirá, a mi nieta le gusta mucho jugar en los vagones del subte, pero hace un tiempo que no la veo, quizá ella te pueda ayudar a recordar como llegaste hasta acá, puedes encontrarla si sigues caminando por el vagón, detrás de ese objeto que obstaculiza el camino. Puedes moverte con las teclas “W, S, A, D” y mover los objetos con la tecla “espacio”",#abuelo
	
]

var numero_dialogo = 0
var velocidad_texto = 09
var fin = false
var forgot = false

func _ready():
	get_tree().paused = true
	$Mensaje.bbcode_text = "Eh..eh..¿En dónde estoy?"
	$Mensaje.percent_visible = 1
	$TextureRect2/AnimationPlayer.play("fin")
	
func _process(delta):
	$TextureRect2.visible = fin
	if forgot == false:
		if Input.is_action_just_pressed("ui_accept"):
			dialogo()
			forgot = true
			
func dialogo():
	if numero_dialogo < dialogo.size():
		fin = false
		$Mensaje.bbcode_text = dialogo[numero_dialogo]
		$Mensaje.percent_visible = 0
		var duracion = velocidad_texto * dialogo[numero_dialogo].length()
		$tween.interpolate_property(
			$Mensaje, "percent_visible",0,1,duracion,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
			)
		$Tween.start()
	else:
		get_tree().paused = false
		queue_free()
	numero_dialogo += 1
	
func _on_Tween_tween_completed(object, key):
	fin = false
	forgot = false

	

