import { CommandHandler, EventPublisher, ICommandHandler } from '@nestjs/cqrs';
import { KillDragonCommand } from '../impl/kill-dragon.command';
import { CinderRepository } from '../../../../infrastructure/prisma/repository/cinder.repository';
import * as clc from 'cli-color';

@CommandHandler(KillDragonCommand)
export class KillDragonHandler implements ICommandHandler<KillDragonCommand> {
  constructor(
    private readonly repository: CinderRepository,
    private readonly publisher: EventPublisher,
  ) {}

  async execute(command: KillDragonCommand): Promise<any> {
    console.log(clc.greenBright('KillDragonCommand...'));

    const { dragonId, cinderId } = command;

    const cinder = this.publisher.mergeObjectContext(
      await this.repository.findOneById(cinderId),
    );

    cinder.killEnemy(dragonId);
    cinder.commit();
  }
}
