import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma.module';
import { PrismaClient } from '@prisma/client';
import { CindersModule } from '../cinders/cinders.module';

@Module({
  imports: [PrismaModule, CindersModule],
  controllers: [],
  providers: [PrismaClient],
})
export class ApplicationModule {}
