extends Control

func _on_StartGameButton_pressed():
	get_tree().change_scene("World.tscn")


func _on_ExitGameBuytton_pressed():
	get_tree().quit()