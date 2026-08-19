extends CanvasLayer
## HUD que mostra a quantidade de cerejas coletadas.
## Ouve o sinal "score_changed" do autoload GameManager.

@onready var score_label: Label = $MarginContainer/ScoreLabel

var pontuacao: int = 0

func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	_update(GameManager.score)


func _on_score_changed(new_score: int) -> void:
	_update(new_score)


func _update(value: int) -> void:
	pontuacao += 1
	score_label.text = "Cerejas: %d" % value
