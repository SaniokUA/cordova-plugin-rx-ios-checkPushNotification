var PLUGIN_NAME = "RXCheckPushNotification";

var RXCheckPushNotification = {
    initPluginNotification: function(data, successCallback, errorCallback){
        cordova.exec(successCallback, errorCallback, PLUGIN_NAME, "initPluginNotification");
    }
}

module.exports = RXCheckPushNotification;
