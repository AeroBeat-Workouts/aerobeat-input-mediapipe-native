class_name AeroBeatMediaPipeNativeStrategy
extends RefCounted
## Future-facing placeholder strategy for native/mobile MediaPipe processing.
##
## This exists so the repo's runtime surface documents intent without implying
## that a production-ready native/mobile tracking implementation already ships.

func get_runtime_expectations() -> Dictionary:
	return {
		"camera_path": "future_mobile_follow_on",
		"official_v1": false,
		"implemented": false,
		"next_real_work": [
			"define native/on-device runtime dependencies",
			"implement concrete capture/tracking bridge",
			"validate on target mobile/runtime environments"
		]
	}
