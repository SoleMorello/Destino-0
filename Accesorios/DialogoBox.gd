extends Control


var dialogo = [
	"Hola..como estas",
	"te comerer a besos"
]

var dialog_intex = 0
var finished = 0


func _ready():
	load_dialog()
	
	
	
func _physics_process(delta): #animacion del cursor 
	$"Next".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
	
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_intex]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
