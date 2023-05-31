#set a base freq
#get the frequency from the AudioEffectSpectrumAnalyzerInstance while audio is playing

var s1 = AudioServer.get_bus_effect_instance(1,0)
var f1 = AudioServer.get_bus_effect(1,1).set_cutoff(68)
var m1: Vector2 = s1.get_magnitude_for_frequency_range(set_freq, set_freq, AudioEffectSpectrumAnalyzerInstance.MAGNITUDE_AVERAGE)

#you can set a function that reports beats when a specified/certain freq is read by the AudioEffectSpectrumAnalyzerInstance
_report_beat(0)

#pass reported beats to a processor which sends a signal to an animation handler for beatmaps generation
func _report_beat(lane):
	if lane == 0:
		emit_signal("lane1")
		timer1.start()

func _on_Conductor_BK_lane1():
	instance = note.instance()
	instance.initialize(0)
	add_child(instance)
	note_count += 1