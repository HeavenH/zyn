import { Module } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { CommandHandlers } from './commands/handlers';
import { EventHandlers } from './events/handlers';
import { CindersController } from './cinders.controller';
import { CinderSagas } from './sagas/cinder.sagas';
import { CinderRepository } from '../../infrastructure/prisma/repository/cinder.repository';

@Module({
  imports: [CqrsModule],
  controllers: [CindersController],
  providers: [
    CinderRepository,
    ...CommandHandlers,
    ...EventHandlers,
    CinderSagas,
  ],
})
export class CindersModule {}
