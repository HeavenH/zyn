import { ICommand, ofType, Saga } from '@nestjs/cqrs';
import { Observable } from 'rxjs';
import { delay, map } from 'rxjs/operators';
import { Injectable } from '@nestjs/common';
import { CinderKilledDragonEvent } from '../events/impl/cinder-killed-dragon.event';
import { AchievementDragonCommand } from '../commands/impl/achievement-dragon.command';
import * as clc from 'cli-color';

const itemId = '0';

@Injectable()
export class CinderSagas {
  @Saga()
  dragonKilled = (events$: Observable<any>): Observable<ICommand> => {
    return events$.pipe(
      ofType(CinderKilledDragonEvent),
      delay(1000),
      map((event) => {
        console.log(clc.whiteBright(`[CinderSagas] - ${CinderKilledDragonEvent.name}`));
        return new AchievementDragonCommand(event.cinderId, itemId);
      }),
    );
  };
}
