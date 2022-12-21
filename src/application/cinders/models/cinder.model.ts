import { AggregateRoot } from '@nestjs/cqrs';
import { CinderKilledDragonEvent } from '../events/impl/cinder-killed-dragon.event';
import { CinderFoundItemEvent } from '../events/impl/cinder-found-item.event';
import { PrismaClient } from '@prisma/client';

export class Cinder extends AggregateRoot {
  constructor(private readonly id: string) {
    super();
  }

  async killEnemy(enemyId: any, cinderId: any) {
    const prisma = new PrismaClient();

    await prisma.achievement.create({
      data: {
        cinderId: 1,
        name: 'gilmar',
      },
    });

    this.apply(new CinderKilledDragonEvent(this.id, enemyId));
  }

  addBadge(itemId: string) {
    // logic
    this.apply(new CinderFoundItemEvent(this.id, itemId));
  }
}
