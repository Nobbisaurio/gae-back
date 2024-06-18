import { ApiProperty } from '@nestjs/swagger';

export class DocumentEntity {
    
    @ApiProperty( { description: 'proceso del documento', example: 'formación en el entorno laboral real dual' } )
    process: string;
    
    @ApiProperty( { description: 'nombre del documento', example: 'Carta de entorno laboral real' } )
    docName: string;
    
    @ApiProperty( { description: 'versión del documento', example: '1.0' } )
    version: string;
    
    @ApiProperty( { description: 'fecha elaboración del documento', example: '16-08-2004' } )
    elaborationDate: string;
    
    @ApiProperty( { description: 'fecha actualización del documento', example: '16-08-2004' } )
    updateDate: string;
    
    @ApiProperty( { description: 'código del documento', example: '010211' } )
    code: string;

    @ApiProperty( { description: 'contenido del documento', example: 'contenido' } )
    documentDefinition: string;
}
