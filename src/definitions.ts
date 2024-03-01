import { PluginListenerHandle } from "@capacitor/core";

export interface CapacitorEventPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  playVideo(video: string): Promise<void>;
  callback(video: string): Promise<void>;
  register(): Promise<void>;
  SessionTimerStart(obj: object): Promise<void>;
  SessionTimerStop(): Promise<void>;
  addListener(eventName: 'OnTouchEvent', listenerFunc: (QRCode: any) => void): PluginListenerHandle;
  addListener(eventName: 'OnClickEvent', listenerFunc: (QRCode: any) => void): PluginListenerHandle;
  addListener(eventName: 'onUserLogout', listenerFunc: (QRCode: any) => void): PluginListenerHandle;
  addListener(eventName: 'OnTimerCountDown', listenerFunc: (QRCode: any) => void): PluginListenerHandle;
}
