import { HttpException, HttpStatus, Injectable, Logger } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateStructuringCoreDto } from './dto/create-structuringCore.dto';
import { StructuringCoreEntity } from './entities/structuringCore.entity';

@Injectable()
export class StructuringCoreService {
  private logger = new Logger(StructuringCoreService.name);

  constructor(private _prismaService: PrismaService) {}

  async create(
    createStructuringCoreDto: CreateStructuringCoreDto,
  ): Promise<StructuringCoreEntity> {
    const existingCore = await this._prismaService.structuredCores.findFirst({
      where: {
        careerCode: createStructuringCoreDto.careerCode,
        careerLevel: createStructuringCoreDto.careerLevel,
      },
    });

    try {
      if (existingCore) {
        const updatedSCore = this._prismaService.structuredCores.update({
          where: { id: existingCore.id },
          data: createStructuringCoreDto,
        });
        return updatedSCore;
      } else {
        const structuredCore = await this._prismaService.structuredCores.create(
          {
            data: createStructuringCoreDto,
          },
        );
        return structuredCore;
      }
    } catch (error) {
      throw new HttpException(error.message, error.status);
    }
  }

  async findAll() {
    try {
      const structuringCores =
        await this._prismaService.structuredCores.findMany();
      return structuringCores;
    } catch (error) {
      throw new HttpException(error.message, error.status);
    }
  }

  async findByCareer(careerCode: string, careerLevel: string) {
    return;
  }
}
