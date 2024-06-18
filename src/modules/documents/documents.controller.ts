import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { DocumentsService } from './documents.service';
import { CreateDocumentDto } from './dto/create-document.dto';
import { UpdateDocumentDto } from './dto/update-document.dto';
import { ApiBearerAuth, ApiCreatedResponse, ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';

@Controller('documents')
@ApiTags('documents')
@ApiBearerAuth()
export class DocumentsController {
  constructor(private readonly documentsService: DocumentsService) {}


  @ApiCreatedResponse({ description: 'documento creado', type: CreateDocumentDto })
  @ApiOperation({ summary: 'Crear documento ' })
  @Post()
  create(@Body() createDocumentDto: CreateDocumentDto) {
    return this.documentsService.create(createDocumentDto);
  }

  @ApiOkResponse( {
    description: 'Obtener todos los documentos',
    type: CreateDocumentDto,
  } )
  @ApiOperation( { summary: 'Obtener todos los documentos' } )
  @Get()
  findAll() {
    return this.documentsService.findAll();
  }

  @ApiOkResponse( {
    description: 'Obtener un documento',
    type: CreateDocumentDto,
  } )
  @ApiOperation( { summary: 'Obtener documento por su ID' } )
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.documentsService.findOne(+id);
  }

  @ApiOkResponse( {
    description: 'Documento Actualizado',
    type: CreateDocumentDto,
  } )
  @ApiOperation( { summary: 'Actualizar una documento por su ID' } )
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDocumentDto: UpdateDocumentDto) {
    return this.documentsService.update(+id, updateDocumentDto);
  }
  
}
