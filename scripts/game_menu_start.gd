extends CanvasLayer

@onready var play_button = $PlayButton

func _ready():
	play_button.pressed.connect(_on_play_button_pressed)
	SolanaService.wallet.connect("on_logged_in", load_game)

func _process(delta):
	pass

func _on_play_button_pressed():
	SolanaService.wallet.try_login()
	load_game(true);

func load_game(success: bool) -> void:
	print("login")
	if success:
		ScreenTransition.transition_to_scene("res://scenes/ui/main_menu.tscn")
	else:
		print("Login failed")
