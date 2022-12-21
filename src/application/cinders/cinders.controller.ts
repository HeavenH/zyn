import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CommandBus } from '@nestjs/cqrs';
import { KillDragonCommand } from './commands/impl/kill-dragon.command';
import { PrismaClient } from '@prisma/client';

@Controller('cinder')
export class CindersController {
  constructor(private readonly commandBus: CommandBus) {}

  @Post('kill')
  async kill(@Param('id') id: string, @Body() dto: any) {
    return this.commandBus.execute(new KillDragonCommand(id, dto.dragonId));
  }

  @Get('achievements')
  async getAchievements() {
    const prisma = new PrismaClient();

    return await prisma.cinder.findMany({
      include: {
        achievements: true,
      },
    });
  }
}
