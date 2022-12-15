import { AggregateRoot } from '@nestjs/cqrs';
import { CinderKilledDragonEvent } from '../events/impl/cinder-killed-dragon.event';
import { CinderFoundItemEvent } from '../events/impl/cinder-found-item.event';

export class Cinder extends AggregateRoot {
  constructor(private readonly id: string) {
    super();
  }

  killEnemy(enemyId: string) {
    // logic
    this.apply(new CinderKilledDragonEvent(this.id, enemyId));
  }

  addBadge(itemId: string) {
    // logic
    this.apply(new CinderFoundItemEvent(this.id, itemId));
  }
}
