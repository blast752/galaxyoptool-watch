::CONFIGURATION PHASE OF THE TOOL
@Echo Off
echo WELCOME ON ONEUI OPTIMIZER
echo watch version: 1.0.1 
echo by @blast752 (thx @DanteHunter)
echo Press "ENTER", otherwise "Ctrl+C" for CLOSE
echo.
pause
::STARTING ADB OVER WIFI CONNECTION
cls
echo KILLING AND STARTING ADB...
adb start-server
echo.
echo ADB IS READY NOW!
echo.
echo Please connect a device:
:STEP2
	set /p ipadr="Enter the IP address of your watch: "
        IF NOT DEFINED ipadr (
                echo IP address is blank.
                echo Trying again.
		echo.
		choice /d y /t 2 > nul
		goto STEP2
        )
	adb connect %ipadr%:5555
	echo.
	
	set /p connected="Did you see any error...? (y/n, default answer is n) => "
	IF NOT DEFINED connected (
		echo EXCELLENT! No Errors found.
		SET "connected=n"
	)
	if %connected% == y (
		echo Repeating the connection...
		choice /d y /t 2 > nul
		goto STEP2
	)
::INITIATION PHASE OF THE TOOL
echo -------------------------------------------
echo STARTING OPTIMIZATION TOOL FOR ONE UI WATCH
echo -------------------------------------------
echo.
echo Optimizing animations...
adb shell settings put global window_animation_scale 0.35
adb shell settings put global transition_animation_scale 0.35
adb shell settings put global window_animation_scale 0.35
echo.
echo Disabling useless settings item...
adb shell settings put global online_manual_url 0
adb shell settings put system remote_control 0
echo.
echo Improving audio quality...
adb shell settings put system tube_amp_effect 1
adb shell settings put system k2hd_effect 1
echo.
echo Disabling useless touch sound...
adb shell settings put system sound_effects_enabled 0
echo.
echo Improving general usage...
adb shell settings put system multicore_packet_scheduler 1
adb shell settings put global cached_apps_freezer enabled
adb shell settings put secure tap_duration_threshold 0.0
adb shell settings put secure touch_blocking_period 0.0
echo.
echo Enabling adpative battery...
adb shell settings put global adaptive_battery_management_enabled 1
echo.
echo Improving apps launch...
adb shell settings put system rakuten_denwa 0
adb shell settings put system remote_control 0
adb shell settings put system send_security_reports 0
echo.
echo Enabling processing speed hack...
adb shell settings put global sem_enhanced_cpu_responsiveness 1
echo.
echo Enabling performance limit (less heat)...
adb shell settings put global restricted_device_performance 1,1
echo.
echo Doing Battery optimizations...
adb shell cmd package bg-dexopt-job
echo.
echo Trimming cache (more times)
adb shell pm trim-caches 999999999999999999
adb shell pm trim-caches 999999999999999999 
adb shell pm trim-caches 999999999999999999
echo.
echo Doing Performance optimizations...
adb shell cmd package compile -m speed-profile -a
echo.
echo --------------------------------------
echo TOOL HAS COMPLETED ALL TASKS
echo THANKS FOR USING MY TOOL by @blast752
echo --------------------------------------
echo.
::END OF TOOL AND CLOSURE OF TERMINAL
