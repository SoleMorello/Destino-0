extends Control

var dialog = [
	"OHH me encontraste, gracias",
	"*****Final del PRIMER NIVEL*****"
]

var dialog_index = 0
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
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
