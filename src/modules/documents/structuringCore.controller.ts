import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { DocumentsService } from './documents.service';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { StructuringCoreEntity } from './entities/structuringCore.entity';
import { StructuringCoreService } from './structuringCore.service';
import { CreateStructuringCoreDto } from './dto/create-structuringCore.dto';

@Controller('structuringCore')
@ApiTags('structuringCore')
@ApiBearerAuth()
export class StructuringCoresController {
  constructor(
    private readonly structuringCoreService: StructuringCoreService,
  ) {}

  @ApiCreatedResponse({
    description: 'nucleo estructurante creado',
    type: CreateStructuringCoreDto,
  })
  @ApiOperation({ summary: 'Crear documento ' })
  @Post()
  create(
    @Body() createStructuringCoreDto: CreateStructuringCoreDto,
  ): Promise<StructuringCoreEntity> {
    return this.structuringCoreService.create(createStructuringCoreDto);
  }

  @ApiOkResponse({
    description: 'Obtener todos los núcleos estucturantes',
    type: CreateStructuringCoreDto,
  })
  @ApiOperation({ summary: 'Obtener todos los núcleos estucturantes' })
  @Get()
  findAll() {
    return this.structuringCoreService.findAll();
  }
}
