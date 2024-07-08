import { HttpException, HttpStatus, Injectable, Logger } from '@nestjs/common';
import { CreateDocumentDto } from './dto/create-document.dto';
import { UpdateDocumentDto } from './dto/update-document.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { DocumentEntity } from './entities/document.entity';

@Injectable()
export class DocumentsService {
  private logger = new Logger(DocumentsService.name);

  constructor(private _prismaService: PrismaService) {}

  async create(createDocumentDto: CreateDocumentDto): Promise<DocumentEntity> {
    const newDocument: CreateDocumentDto = {
      process: createDocumentDto.process,
      docName: createDocumentDto.docName,
      version: createDocumentDto.version,
      elaborationDate: createDocumentDto.elaborationDate,
      updateDate: createDocumentDto.updateDate,
      code: createDocumentDto.code,
      documentDefinition: createDocumentDto.documentDefinition,
    };

    try {
      const document = await this._prismaService.documents.create({
        data: newDocument,
      });

      return document;
    } catch (error) {
      throw new HttpException(error.message, error.status);
    }
  }

  async findAll(): Promise<DocumentEntity[]> {
    try {
      const documents = await this._prismaService.documents.findMany();
      return documents;
    } catch (error) {
      throw new HttpException(error.message, error.status);
    }
  }

  async findOne(id: number) {
    const document = await this._prismaService.documents.findUnique({
      where: {
        id: id,
      },
    });

    if (!document) {
      throw new HttpException(
        `Documento con el id: ${id}, no existe`,
        HttpStatus.NOT_FOUND,
      );
    }

    return document;
  }

  async update(id: number, updateDocumentDto: UpdateDocumentDto) {
    const documentExist = await this.findOne(id);

    if (!documentExist) {
      throw new HttpException('El documento no existe', HttpStatus.NOT_FOUND);
    }

    try {
      return await this._prismaService.documents.update({
        where: {
          id: id,
        },
        data: updateDocumentDto,
      });
    } catch (error) {
      throw new HttpException(error.message, error.status);
    }
  }
}
