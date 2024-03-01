#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(EventPlugin, "EventPlugin",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(playVideo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(callback, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(SessionTimerStart, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(SessionTimerStop, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(register, CAPPluginReturnPromise);
)
