extends GutTest

func before_all():
	gut.p("Starting native MediaPipe input driver tests...")

func after_all():
	gut.p("Finished native MediaPipe input driver tests.")

func test_src_root_layout_is_present():
	assert_true(FileAccess.file_exists("res://src/input_manager.gd"), "input_manager.gd should exist in the src-rooted package layout")
	assert_true(FileAccess.file_exists("res://src/strategies/strategy_mediapipe.gd"), "strategy_mediapipe.gd should exist in the repo")

func test_repo_plugin_metadata_is_present_next_to_the_workbench():
	var plugin_cfg_path := ProjectSettings.globalize_path("res://../plugin.cfg")
	assert_true(FileAccess.file_exists(plugin_cfg_path), "plugin.cfg should exist at the repo root next to the hidden workbench")
