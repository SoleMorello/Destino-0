extends Box

class_name PhysicsBox


func push(velocity: Vector2) -> void:
	move_and_slide(velocity,Vector2())

var tipo_box = ["Box", "Diario"]

func _ready():
	$AnimatedSprite.animation = tipo_box[randi() % tipo_box.size() ]
	
