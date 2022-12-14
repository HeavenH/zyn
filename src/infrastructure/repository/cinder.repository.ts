import { PrismaClient } from '@prisma/client/scripts/default-index';

export class CinderRepository {
  constructor(private readonly prisma: PrismaClient) {}
}
