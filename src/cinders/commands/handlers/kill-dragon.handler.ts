import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { KillDragonCommand } from "../impl/kill-dragon.command";

@CommandHandler(KillDragonCommand)
export class KillDragonHandler implements ICommandHandler<KillDragonCommand> {
  constructor() {
  }
}
