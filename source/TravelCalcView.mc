using Toybox.WatchUi as Ui;

class TravelCalcView extends Ui.SimpleDataField {
	const MIN_AVR_SPEED = Application.getApp().getProperty("myAverageSpeed"); // meters per second
	var counter = 0;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Time to rest";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var averageSpeed = info.averageSpeed ? info.averageSpeed : 0;  // meters per second
        var elapsedTime = (info.elapsedTime ? info.elapsedTime : 0) / 1000; // ms to sec
        var advance = averageSpeed - MIN_AVR_SPEED;
        
        if (advance < 0) {
        	advance = 0;
        }
        
        var time = advance * elapsedTime / MIN_AVR_SPEED;
        var seconds = time.toLong();
		var hours = seconds / 3600;
		seconds -= hours * 3600;
		var minutes = seconds / 60;

		return "" + hours.format("%02d") + ":" + minutes.format("%02d") + " h";
    }
}