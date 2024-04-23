extends Node2D

var dragging: bool = false
var drag_start = Vector2.ZERO
var select_rect = RectangleShape2D.new()
var selected = []
var apple_id: int
var score: int = 0
var score_string
var guide: bool = true
var timer_start: bool = false
var time_left: int = 90
var game_over: bool = false
var can_reset: bool = false

var arrow = preload("res://assets/arrow.png")
var beam = preload("res://assets/Beam.png")

func _ready():
	Input.set_custom_mouse_cursor(arrow)
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)

func _process(_delta):
	if guide:
		$main_guide.visible = true
	else:
		$main_guide.visible = false
	
	var time_left_string = str(time_left)
	$main_time.text = time_left_string

	if !game_over:
		if Input.is_action_just_pressed("click"):
			dragging = true
			drag_start = get_global_mouse_position()
		if dragging:
			queue_redraw()
			if Input.is_action_just_released("click"):
				$main_explosion.position = get_global_mouse_position()
				$main_explosion.emitting = false
				dragging = false
				var drag_end = get_global_mouse_position()
				select_rect.extents = abs(drag_end - drag_start) / 2
				var space = get_world_2d().direct_space_state
				var query = PhysicsShapeQueryParameters2D.new()
				query.collide_with_areas = true
				query.set_shape(select_rect)
				query.transform = Transform2D(0, (drag_end + drag_start) / 2)
				selected = space.intersect_shape(query)

			var sum: int = 0
			for item in selected:
				apple_id = item["collider"].id
				sum += apple_id

			if (sum == 10 || sum == 20 || sum == 30 || sum == 40 || sum == 50):
				$main_sound.play()
				$main_explosion.emitting = true
				guide = false
				score += sum
				score_string = str(score)
				$main_score.text = score_string
				for item in selected:
					item["collider"].queue_free()
				selected = []

	if time_left == 0:
		$main_final.text = score_string
		$main_reset_2.visible = false
		game_over = true
		$main_timer.stop()
		if Input.is_action_just_pressed("click") and $main_reset_timer.is_stopped():
			get_tree().reload_current_scene()

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, get_global_mouse_position() - drag_start), 
		Color.GREEN, false, 0.3)

func _on_main_timer_timeout():
	time_left -= 1

func _on_reset_button_pressed():
	get_tree().reload_current_scene()
	audio_singleton._play_audio()

func _on_main_reset_2_hidden():
	$main_win_sound.play()

func _on_main_reset_timer_timeout():
	$main_reset.visible = true
	can_reset = true
