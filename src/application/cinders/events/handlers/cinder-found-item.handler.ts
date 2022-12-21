import { EventsHandler, IEventHandler } from '@nestjs/cqrs';
import { CinderFoundItemEvent } from '../impl/cinder-found-item.event';
import * as clc from 'cli-color';

@EventsHandler(CinderFoundItemEvent)
export class CinderFoundItemHandler
  implements IEventHandler<CinderFoundItemEvent>
{
  handle(event: CinderFoundItemEvent) {
    console.log(clc.yellowBright('[Async Event] - CinderFoundItemEvent'));
  }
}
