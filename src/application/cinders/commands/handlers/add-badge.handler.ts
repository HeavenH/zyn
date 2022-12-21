import { CommandHandler, EventPublisher, ICommandHandler } from '@nestjs/cqrs';
import { CinderRepository } from '../../../../infrastructure/prisma/repository/cinder.repository';
import { AchievementDragonCommand } from '../impl/achievement-dragon.command';
import * as clc from 'cli-color';

@CommandHandler(AchievementDragonCommand)
export class AddBadgeHandler
  implements ICommandHandler<AchievementDragonCommand>
{
  constructor(
    private readonly repository: CinderRepository,
    private readonly publisher: EventPublisher,
  ) {}

  async execute(command: AchievementDragonCommand): Promise<any> {
    console.log(clc.cyanBright(`[Async Command] - ${AchievementDragonCommand.name}`));

    const { badgeId, cinderId } = command;

    const cinder = this.publisher.mergeObjectContext(
      await this.repository.findOneById(cinderId),
    );

    cinder.addBadge(badgeId);
    cinder.commit();
  }
}