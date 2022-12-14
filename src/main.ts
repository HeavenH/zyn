import { NestFactory } from '@nestjs/core';
import { ApplicationModule } from './application/modules/app.module';

async function bootstrap() {
  const app = await NestFactory.create(ApplicationModule);
  await app.listen(2222);
}
bootstrap();
