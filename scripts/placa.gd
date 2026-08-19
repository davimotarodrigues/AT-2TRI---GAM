extends Area2D


var cerejas_na_fase: int = 5


@onready var texto: Label = $Cereja


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		texto.text = "Fase concluida! Ao todo eram" + str(cerejas_na_fase) + "cerejas"
		return
	
