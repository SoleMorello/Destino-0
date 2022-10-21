extends Control
var finished = false


var dialog = [
	
	"Hasta que porfin despiertas muchacho",
	"Eh..eh..¿En dónde estoy?",
	"El subte ya acabó su recorrido ¿Cuál era tu destino final?",
	"No consigo recordar, no sé cómo terminé acá",
	"¿Recuerdas tu nombre?",
	"Lautaro",
	"Ahhh, Lautaro, mucho gusto, yo me llamo Arsenio. Mirá, a mi nieta le gusta mucho jugar en los vagones del subte, pero hace un tiempo que no la veo, quizá ella te pueda ayudar a recordar como llegaste hasta acá, puedes encontrarla si sigues caminando por el vagón, detrás de ese objeto que obstaculiza el camino. Puedes moverte con las teclas “W, S, A, D” y mover los objetos con la tecla “espacio”"
	
]

var dialog_index = 0 #indise del dialogo
var text_speed = 0.1

func _ready():
	$RichTextLabel.bbcode_text = "" #texto vacio
	load_dialog() #aparesca el principio
	

func _process(delta): #funcion para ser apretada
	$Next.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
	
	
		
func load_dialog(): #
	
	if dialog_index < dialog.size():
		finished = false #el texto no termina 
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0 #visible ver animacion
		var tween_duration = text_speed * dialog[dialog_index].length() #duracion tiempo de animacion
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, tween_duration, #objeto q propiedad
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start() #ejecute
	else:
			queue_free() #desaparece el nodo y sigue el juego
	dialog_index +=1 #pase al siguiente texto



func _on_Tween_tween_completed(object, key):
	finished = true
