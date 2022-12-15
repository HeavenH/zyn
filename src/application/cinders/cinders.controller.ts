import { Body, Controller, Param, Post } from '@nestjs/common';
import { CommandBus } from '@nestjs/cqrs';
import { KillDragonCommand } from './commands/impl/kill-dragon.command';
@Controller('hero')
export class CindersController {
  constructor(
    private readonly commandBus: CommandBus,
  ) {}

  @Post(':id/kill')
  async killDragon(@Param('id') id: string, @Body() dto: any) {
    return this.commandBus.execute(new KillDragonCommand(id, dto.dragonId));
  }
}
