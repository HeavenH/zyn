import { PrismaClient } from '@prisma/client/scripts/default-index';
import { Cinder } from '../../../application/cinders/models/cinder.model';

export class CinderRepository {
  constructor(private readonly prisma: PrismaClient) {}

  async findOneById(id: string): Promise<any> {

    return new Cinder(id);
  }
}
