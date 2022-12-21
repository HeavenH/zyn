import { IEventHandler } from '@nestjs/cqrs';
import { EventsHandler } from '@nestjs/cqrs/dist/decorators/events-handler.decorator';
import { CinderKilledDragonEvent } from '../impl/cinder-killed-dragon.event';
import * as clc from 'cli-color';

@EventsHandler(CinderKilledDragonEvent)
export class CinderKilledDragonHandler
  implements IEventHandler<CinderKilledDragonEvent>
{
  handle(event: CinderKilledDragonEvent) {
    console.log(clc.yellowBright(`[Event] - ${CinderKilledDragonEvent.name}`));
  }
}
