extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.power_up()
		body.brilhar()
		queue_free()
