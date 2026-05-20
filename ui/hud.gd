class_name HUD
extends CanvasLayer
## Runtime-built gameplay HUD skeleton for wave, score, HP, and enemy count.

const DEFAULT_MAX_HEALTH: int = 100

var _score: int = 0
var _wave_number: int = 1
var _enemies_remaining: int = 0
var _current_health: int = DEFAULT_MAX_HEALTH
var _max_health: int = DEFAULT_MAX_HEALTH

var _wave_label: Label
var _score_label: Label
var _enemy_label: Label
var _health_label: Label
var _health_bar: ProgressBar
var _game_over_label: Label


func _ready() -> void:
	layer = 20
	_build_layout()
	_connect_event_bus()
	_refresh_all()


func _build_layout() -> void:
	var root := Control.new()
	root.name = "HUDRoot"
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(root)

	var top_left := VBoxContainer.new()
	top_left.name = "StatusPanel"
	top_left.offset_left = 24.0
	top_left.offset_top = 24.0
	top_left.offset_right = 360.0
	top_left.offset_bottom = 180.0
	root.add_child(top_left)

	_wave_label = _make_label("Wave: 1", 28)
	_score_label = _make_label("Score: 0", 24)
	_enemy_label = _make_label("Enemies: 0", 24)
	_health_label = _make_label("HP: 100 / 100", 24)
	top_left.add_child(_wave_label)
	top_left.add_child(_score_label)
	top_left.add_child(_enemy_label)
	top_left.add_child(_health_label)

	_health_bar = ProgressBar.new()
	_health_bar.name = "HealthBar"
	_health_bar.min_value = 0.0
	_health_bar.max_value = float(DEFAULT_MAX_HEALTH)
	_health_bar.value = float(DEFAULT_MAX_HEALTH)
	_health_bar.custom_minimum_size = Vector2(280.0, 18.0)
	top_left.add_child(_health_bar)

	_game_over_label = _make_label("", 44)
	_game_over_label.name = "GameOverLabel"
	_game_over_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_game_over_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_game_over_label.set_anchors_preset(Control.PRESET_FULL_RECT)
	_game_over_label.visible = false
	root.add_child(_game_over_label)


func _connect_event_bus() -> void:
	EventBus.player_health_changed.connect(_on_player_health_changed)
	EventBus.player_died.connect(_on_player_died)
	EventBus.score_changed.connect(_on_score_changed)
	EventBus.wave_changed.connect(_on_wave_changed)
	EventBus.enemies_remaining_changed.connect(_on_enemies_remaining_changed)


func _make_label(text_value: String, font_size: int) -> Label:
	var label := Label.new()
	label.text = text_value
	label.add_theme_font_size_override(&"font_size", font_size)
	label.add_theme_color_override(&"font_color", Color(0.92, 0.96, 1.0))
	label.add_theme_color_override(&"font_shadow_color", Color(0.0, 0.0, 0.0, 0.8))
	label.add_theme_constant_override(&"shadow_offset_x", 2)
	label.add_theme_constant_override(&"shadow_offset_y", 2)
	return label


func _refresh_all() -> void:
	_wave_label.text = "Wave: %d" % _wave_number
	_score_label.text = "Score: %d" % _score
	_enemy_label.text = "Enemies: %d" % _enemies_remaining
	_health_label.text = "HP: %d / %d" % [_current_health, _max_health]
	_health_bar.max_value = float(max(1, _max_health))
	_health_bar.value = float(clamp(_current_health, 0, _max_health))


func _on_player_health_changed(current_health: int, max_health: int) -> void:
	_current_health = current_health
	_max_health = max(1, max_health)
	_refresh_all()


func _on_player_died(final_score: int) -> void:
	_game_over_label.text = "GAME OVER\nScore: %d" % final_score
	_game_over_label.visible = true


func _on_score_changed(score: int) -> void:
	_score = score
	_refresh_all()


func _on_wave_changed(wave_number: int, enemies_remaining: int) -> void:
	_wave_number = max(1, wave_number)
	_enemies_remaining = max(0, enemies_remaining)
	_refresh_all()


func _on_enemies_remaining_changed(enemies_remaining: int) -> void:
	_enemies_remaining = max(0, enemies_remaining)
	_refresh_all()
