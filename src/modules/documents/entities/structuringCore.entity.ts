import { ApiProperty } from '@nestjs/swagger';

export class StructuringCoreEntity {
  @ApiProperty({
    description: 'carrera del núcleo',
    example: 'Desarollo de Software',
  })
  careerCode: string;

  @ApiProperty({ description: 'nivel de la carrera', example: 'QUINTO' })
  careerLevel: string;

  @ApiProperty({
    description: 'nombre del núcle estructurante',
    example: 'programación orientada a objetos',
  })
  coreName: string;
}
