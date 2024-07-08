import { Module } from '@nestjs/common';
import { DocumentsService } from './documents.service';
import { DocumentsController } from './documents.controller';
import { PrismaModule } from 'src/prisma/prisma.module';
import { StructuringCoreService } from './structuringCore.service';
import { StructuringCoresController } from './structuringCore.controller';

@Module({
  controllers: [DocumentsController, StructuringCoresController],
  providers: [DocumentsService, StructuringCoreService],
  imports: [PrismaModule],
})
export class DocumentsModule {}
