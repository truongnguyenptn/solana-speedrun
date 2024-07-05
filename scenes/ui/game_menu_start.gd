extends CanvasLayer

@export var wallet_adapter: WalletAdapterUI
func _ready():
	
	SolanaService.wallet.connect("on_logged_in",load_game)
	SolanaService.wallet.connect("on_login_begin",pop_adapter)
	
	
	wallet_adapter.visible = false
	wallet_adapter.connect("on_provider_selected", handle_provider_selected)
	wallet_adapter.connect("on_adapter_cancel",close_adapter)
	
	pass

func pop_adapter() -> void:
	wallet_adapter.visible = true
	print("vkl")
	print(SolanaService.wallet.wallet_adapter.get_available_wallets())
	wallet_adapter.setup([0, 2])
#
func close_adapter() -> void:
	wallet_adapter.visible = false

func handle_provider_selected(id: int) -> void:
	SolanaService.wallet.login_adapter(id)
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

