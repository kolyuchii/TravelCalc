using Toybox.WatchUi as Ui;

class TravelCalcView extends Ui.SimpleDataField {
	var minAvrSpeed = (Application.getApp().getProperty("myAverageSpeed") || 15) * 1000 / 3600; // meters per second

    function initialize() {
        SimpleDataField.initialize();
        label = "Time to rest";
    }

    function compute(info) {
        var averageSpeed = info.averageSpeed ? info.averageSpeed : 0;  // meters per second
        var elapsedTime = (info.elapsedTime ? info.elapsedTime : 0) / 1000; // ms to sec
        var advance = averageSpeed - minAvrSpeed;
        
        if (advance < 0) {
        	advance = 0;
        }
        
        var time = advance * elapsedTime / minAvrSpeed;
        var seconds = time.toLong();
		var hours = seconds / 3600;
		seconds -= hours * 3600;
		var minutes = seconds / 60;

		return hours.format("%02d") + ":" + minutes.format("%02d") + " h";
    }
}