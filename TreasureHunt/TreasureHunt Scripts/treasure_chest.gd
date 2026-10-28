extends TileMapLayer

var is_opened = false
var is_in = false
@onready var how_to_interact: Label = $Area2D/HowToInteract2
@onready var x_mark: Area2D = $"../X mark"
@onready var label_win: Label = $"../HUD/Label_win"

func _physics_process(delta: float) -> void:
	chest_interaction()
	how_to_interact.visible = is_in and not is_opened and x_mark.is_opened

func _on_area_2d_body_entered(body: Node2D) -> void:
	is_in = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	is_in = false

func chest_interaction():
	if Input.is_action_just_pressed("Interact"):
		if is_in == true:
			if is_opened == false:
				if x_mark.is_opened == true:
					print("is opened")
					win()
					is_opened = true

func win():
	label_win.show()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/game.tscn")
