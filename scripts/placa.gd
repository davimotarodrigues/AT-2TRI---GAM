extends Area2D


var cerejas_na_fase: int = 5


@onready var mensagem: Label = $Mensagem


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	mensagem.text = "Fase concluida! Ao todo eram" + str(cerejas_na_fase) + "cerejas"
