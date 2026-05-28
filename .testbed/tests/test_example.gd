extends GutTest

func before_all():
	gut.p("Starting native MediaPipe input driver tests...")

func after_all():
	gut.p("Finished native MediaPipe input driver tests.")

func test_src_root_layout_is_present():
	assert_true(FileAccess.file_exists("res://addons/aerobeat-input-mediapipe-native/src/input_manager.gd"), "input_manager.gd should exist in the src-rooted package layout")
	assert_true(FileAccess.file_exists("res://addons/aerobeat-input-mediapipe-native/src/strategies/strategy_mediapipe.gd"), "strategy_mediapipe.gd should exist in the repo")

func test_repo_plugin_metadata_is_present_next_to_the_workbench():
	var plugin_cfg_path := ProjectSettings.globalize_path("res://../plugin.cfg")
	assert_true(FileAccess.file_exists(plugin_cfg_path), "plugin.cfg should exist at the repo root next to the hidden workbench")

func test_future_path_runtime_placeholders_are_truthful():
	var input_manager_script := load("res://addons/aerobeat-input-mediapipe-native/src/input_manager.gd")
	assert_not_null(input_manager_script, "input_manager.gd should load as a valid script")

	var input_manager = input_manager_script.new()
	var scope = input_manager.describe_scope()
	assert_eq(scope.get("product_status"), "future_mobile_follow_on", "input manager should describe this repo as a future mobile follow-on path")
	assert_eq(scope.get("official_v1"), false, "input manager should not claim this repo is the official v1 gameplay path")

	var strategy_script := load("res://addons/aerobeat-input-mediapipe-native/src/strategies/strategy_mediapipe.gd")
	assert_not_null(strategy_script, "strategy_mediapipe.gd should load as a valid script")

	var strategy = strategy_script.new()
	var expectations = strategy.get_runtime_expectations()
	assert_eq(expectations.get("implemented"), false, "strategy placeholder should not imply a completed runtime implementation")
	assert_eq(expectations.get("official_v1"), false, "strategy placeholder should not claim official v1 status")
