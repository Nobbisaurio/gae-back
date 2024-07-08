import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class CreateStructuringCoreDto {
  @IsString({ message: 'el proceso debe contener texto' })
  @IsNotEmpty({ message: 'el proceso del documento no debe estar vacío' })
  @ApiProperty({
    description: 'carrera del núcleo',
    example: 'Desarollo de Software',
  })
  careerCode: string;

  @IsString({ message: 'el proceso debe contener texto' })
  @IsNotEmpty({ message: 'el proceso del documento no debe estar vacío' })
  @ApiProperty({ description: 'nivel de la carrera', example: 'QUINTO' })
  careerLevel: string;

  @IsString({ message: 'el proceso debe contener texto' })
  @IsNotEmpty({ message: 'el proceso del documento no debe estar vacío' })
  @ApiProperty({
    description: 'nombre del núcle estructurante',
    example: 'programación orientada a objetos',
  })
  coreName: string;
}
