extends CanvasLayer


func _ready():
	SolanaService.wallet.connect("on_logged_in",load_game)
	pass

func _process(delta):
	pass

func _on_play_button_pressed():
	SolanaService.wallet.try_login()

func load_game(success: bool) -> void:
	if success:
		get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	else:
		print("Login failed")


func _on_button_pressed():
	SolanaService.wallet.try_login()

