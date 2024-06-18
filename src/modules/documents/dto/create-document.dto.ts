import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class CreateDocumentDto {
    @IsString({message: 'el proceso debe contener texto'})
    @IsNotEmpty({message: 'el proceso del documento no debe estar vacío'})
    @ApiProperty( { description: 'proceso del documento', example: 'formación en el entorno laboral real dual' } )
    process: string
    
    @IsString({message: 'el nombre del documento debe contener texto'})
    @IsNotEmpty({message: 'el nombre del documento no debe estar vacío'})
    @ApiProperty( { description: 'nombre del documento', example: 'Carta de entorno laboral real' } )
    docName: string;

    @IsString({message:'la versión debe contener texto'})
    @IsNotEmpty({message: 'la versión del documento no debe estar vacía'})
    @ApiProperty( { description: 'versión del documento', example: '1.0' } )
    version: string;

    @IsString({message:'la fecha de elaboración debe contener texto'})
    @IsNotEmpty({message: 'la fecha de elaboración no debe estar vacía'})
    @ApiProperty( { description: 'fecha elaboración del documento', example: '16-08-2004' } )
    elaborationDate: string;

    @IsString({message:'la fecha de actualización debe contener texto'})
    @IsNotEmpty({message: 'la fecha de actualización no debe estar vacía'})
    @ApiProperty( { description: 'fecha actualización del documento', example: '16-08-2004' } )
    updateDate: string;

    @IsString({message:'el código debe contener texto'})
    @IsNotEmpty({message: 'el código no debe estar vacío'})
    @ApiProperty( { description: 'código del documento', example: '010211' } )
    code: string;

    @IsString( { message: 'el dd debe contener texto' } )
    @IsNotEmpty( { message: 'el dd no debe estar vacío' } )
    @ApiProperty( { description: 'dd del documento', example: '010211' } )
    documentDefinition: string
}


