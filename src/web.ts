import { WebPlugin } from '@capacitor/core';

import type { CapacitorEventPlugin } from './definitions';

export class CapacitorEventWeb
  extends WebPlugin
  implements CapacitorEventPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async playVideo(video: string): Promise<void> {
    console.log('ECHO', video);
  }

  async callback(video: string): Promise<void> {
    console.log('callback', video);
  }

  async register(): Promise<void> {
  }

  async SessionTimerStart(obj: object): Promise<void> {
    console.log('callback', obj);
  }

  async SessionTimerStop(): Promise<void> {
  }

}
