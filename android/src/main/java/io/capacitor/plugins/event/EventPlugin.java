package io.capacitor.plugins.event;

import android.annotation.SuppressLint;
import android.os.CountDownTimer;
import android.util.Log;
import android.webkit.WebView;

import com.getcapacitor.Bridge;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "EventPlugin")
public class EventPlugin extends Plugin {
    public static EventPlugin instance;
    public CountDownTimer timer;
    private static WebView webview;

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");
        JSObject ret = new JSObject();
        ret.put("value", value);
        call.resolve(ret);
    }

    @PluginMethod
    public void callback(PluginCall call) {
        String value = call.getString("value");
        JSObject ret = new JSObject();
        ret.put("value", value);
        call.resolve(ret);
    }

    @PluginMethod
    public void SessionTimerStart(PluginCall call) {
        String value = call.getString("value");
        if (value != null) {
            timer = new CountDownTimer((long) Integer.parseInt(value) *60*1000, 1000) {
                public void onTick(long millisUntilFinished) {
                    Log.println(Log.ASSERT, "Timer::", "Started" + (millisUntilFinished / 1000));
                    JSObject ret = new JSObject();
                    ret.put("value",millisUntilFinished);
                    OnTimerCountDown(ret);
                }

                public void onFinish() {
                    timer.cancel();
                    onUserLogout();
                    Log.println(Log.ASSERT, "Timer::", "Stoped");
                }
            };
            JSObject ret = new JSObject();
            ret.put("value", "session start");
            call.resolve(ret);
            TimerStart();
        }

    }

    public void TimerStart() {
        if (timer != null)
            timer.start();
    }

    @PluginMethod
    public void SessionTimerStop() {
        if (timer != null)
            timer.cancel();
    }

    @PluginMethod
    public void register(PluginCall call) {
        instance = this;
        JSObject ret = new JSObject();
        ret.put("value", "done");
        call.resolve(ret);
    }

    public static EventPlugin getInstance() {
        return instance;
    }

    public void OnTouchEvent(JSObject obj) {
        notifyListeners("OnTouchEvent", obj);
    }

    public void OnClickEvent(JSObject obj) {
        notifyListeners("OnClickEvent", obj);
    }

    public void OnTimerCountDown(JSObject obj) {
        notifyListeners("OnTimerCountDown", obj);
    }

    @PluginMethod
    public void onUserLogout() {
        JSObject obj = new JSObject();
        obj.put("value", "logout user session");
        notifyListeners("onUserLogout", obj);
    }
}
