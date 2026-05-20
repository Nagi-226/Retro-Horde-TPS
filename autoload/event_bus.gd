extends Node
## Global gameplay signal bus for v0.0.2 systems.
##
## Keep this singleton thin: it only broadcasts cross-scene state changes.

signal player_health_changed(current_health: int, max_health: int)
signal player_died(final_score: int)
signal score_changed(score: int)
signal wave_changed(wave_number: int, enemies_remaining: int)
signal enemies_remaining_changed(enemies_remaining: int)


func emit_player_health_changed(current_health: int, max_health: int) -> void:
	player_health_changed.emit(current_health, max_health)


func emit_player_died(final_score: int) -> void:
	player_died.emit(final_score)


func emit_score_changed(score: int) -> void:
	score_changed.emit(score)


func emit_wave_changed(wave_number: int, enemies_remaining: int) -> void:
	wave_changed.emit(wave_number, enemies_remaining)


func emit_enemies_remaining_changed(enemies_remaining: int) -> void:
	enemies_remaining_changed.emit(enemies_remaining)
