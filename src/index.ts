import { registerPlugin } from '@capacitor/core';

import type { CapacitorEventPlugin } from './definitions';

const CapacitorEvent = registerPlugin<CapacitorEventPlugin>(
  'EventPlugin',{
    web: () => import('./web').then(m => new m.CapacitorEventWeb()),},
);

export * from './definitions';
export { CapacitorEvent };
