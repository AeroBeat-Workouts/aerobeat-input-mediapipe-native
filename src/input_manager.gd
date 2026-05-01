class_name AeroBeatMediaPipeNativeInputManager
extends RefCounted
## Future-facing placeholder for AeroBeat's native/mobile MediaPipe camera path.
##
## This repo is intentionally not the official v1 gameplay-input implementation.
## The current official gameplay path remains PC camera-first. Keep this surface
## truthful until real native/mobile runtime integration work resumes.

const PROVIDER_ID := "mediapipe_native"
const INPUT_PROFILE := "mediapipe_camera"
const PRODUCT_STATUS := "future_mobile_follow_on"

func describe_scope() -> Dictionary:
	return {
		"provider_id": PROVIDER_ID,
		"input_profile": INPUT_PROFILE,
		"product_status": PRODUCT_STATUS,
		"official_v1": false,
		"notes": [
			"Preserved as a future native/mobile camera path.",
			"Does not currently implement a validated runtime pipeline.",
			"Official v1 gameplay input remains the PC camera path."
		]
	}
