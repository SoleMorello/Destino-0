extends CanvasLayer

export(String, FILE, ".Player") var dialogue_file

var dialogues = []
var current_dialogo_id = 0


func _ready():
	play()
	
	
func play():
	dialogues = load_dialogue():
	
	current_dialogo_id = -1
	next_line()
	
	
func _Input(event):
	if event_is_action_pressed("game_usage"):
		next_line()
		
func next_line():
	current_dialogo_id += 1
			
			
		$NinePatchRect.text = dialogue[current_dialogue_id]["text"]
		
func load_dialoque():
	var file = file.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())

