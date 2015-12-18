//
//  ListasFijas.m
//  Aviacion
//
//  Created by Andres Abril on 5/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "ListasFijas.h"

@implementation ListasFijas
+(NSMutableArray*)listaAmenazaAlaFija{
    NSArray *namesArray = @[@"REMOTA",@"PROBABLE",@"INMINENTE"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaSupervisionAlaFija{
    NSArray *namesArray = @[@"ADM D/N",@"TACTICA DIA",@"TACTICA NOCHE"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaPlaneamientoAlaFija{
    NSArray *namesArray = @[@"1 HORA O MÁS",@"30 MIN",@"20 MIN"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaDiasAlaFija{
    NSArray *namesArray = @[@"1 a 7",@"8 a 14",@"15 a 20",@"21 ó más"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaHorasAlaFija{
    NSArray *namesArray = @[@"MÁS DE 30",@"10 a 30",@"5 a 10",@"MENOS DE 5"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaSalidaDestinoAlaFija{
    NSArray *namesArray = @[@"CAVOK-SCT",@"FEW-BKN",@"OBC",@"SOBRE MÍNIMOS"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaComplejidadDeLaMisionAlaFija{
    NSArray *namesArray = @[@"DÍA",@"NOCHE",@"IFR"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaCondicionDePistaAlaFija{
    NSArray *namesArray = @[@"MÁS DE 2000",@"MENOS DE 2000",@"MENOS DE 1000"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaRendimientoTripulacionAlaFija{
    NSArray *namesArray = @[@"8 HORAS",@"6 A 8 HORAS",@"MENOS 6 HORAS"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaTipoAeronaveAlaFija{
    NSArray *namesArray = @[@"MONOMOTOR TURBINA",@"BIMOTOR TURBINA"];
    NSArray *valuesArray = @[@1,@2];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

#pragma mark - listas para ala rotatoria
+(NSMutableArray*)listaAmenazaAlaRotatoria{
    NSArray *namesArray = @[@"MISIONES GENERALES Y/O OTRAS",@"BAJA",@"MEDIA",@"ALTA",@"MUY ALTA"];
    NSArray *valuesArray = @[@1,@2,@3,@4,@5];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaSupervisionAlaRotatoria{
    NSArray *namesArray = @[@"MISIONES GENERALES DE AVIACIÓN Y/O OTRAS",@"TÁCTICA DÍA",@"TÁCTICA LVN"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaPlaneamientoAlaRotatoria{
    NSArray *namesArray = @[@"EXACTO 24 Hrs Ó MÁS",@"ADECUADO 12 A 24 Hrs",@"MÍNIMO MENOS DE 12 Hrs"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaDiasDisponibilidadDeVueloAlaRotatoria{
    NSArray *namesArray = @[@"menor o igual a 7 dias ",@"> 7 dias",@"> 15 dias",@"> de 21",@"> de 30"];
    NSArray *valuesArray = @[@1,@2,@3,@4,@5];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaExperienciaPAMAlaRotatoria{
    NSArray *namesArray = @[@"Más de 2.000",@"De1.000 a 2000",@"De 600 a 1000"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaExperienciaPAlaRotatoria{
    NSArray *namesArray = @[@"Más de 2.000",@"De1.000 a 2000",@"De 500 a 1000",@"Menos de 500"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaExperienciaTripulanteAdicionalAlaRotatoria{
    NSArray *namesArray = @[@"Más de 2.000",@"De1.000 a 2000",@"De 500 a 1000",@"Menos de 500"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaDiasSinRealisarElMismoTipoAlaRotatoria{
    NSArray *namesArray = @[@"< de 60 dias",@"> 90 dias",@"> 120 dias",@"> 150 dias",@"> 180 dias"];
    NSArray *valuesArray = @[@1,@2,@3,@4,@5];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaRendimientoTripulacionAlaRotatoria{
    NSArray *namesArray = @[@"Más de 8 horas",@"De 6 a 8 horas",@"Menos de 6 horas",@"Día de relevo"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaCondicionesMeteorologicasAlaRotatoria{
    NSArray *namesArray = @[@"Más de 1.500 pies 3km",@"Menos de 1.500 pies 3km"];
    NSArray *valuesArray = @[@1,@2];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaComplejidadAlaRotatoria{
    NSArray *namesArray = @[@"DÍA",@"NOCHE",@"LVN",@"IFR"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaFactoresGeograficosAlaRotatoria{
    NSArray *namesArray = @[@"DÍA",@"LVN"];
    NSArray *valuesArray = @[@1,@2];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaSeleccionAlaRotatoria{
    NSArray *namesArray = @[@"Más de 150",@"De 150 a 100",@"De 50 a 25",@"Menos de 25"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaPorcentajeIluminacionAlaRotatoria{
    NSArray *namesArray = @[@"De 50 a 100 %",@"De 23 a 49%",@" Menos de 23 %"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaAnguloLunaAlaRotatoria{
    NSArray *namesArray = @[@"Más de 30°",@"Menos de 30°"];
    NSArray *valuesArray = @[@1,@2];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

#pragma mark - helper function
+(NSMutableArray*)createArrayWithNames:(NSArray*)namesArray andValue:(NSArray*)valuesArray{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i=0; i<namesArray.count; i++) {
        [array addObject:@{@"name":namesArray[i], @"value":valuesArray[i]}];
    }
    return array;
}
@end
