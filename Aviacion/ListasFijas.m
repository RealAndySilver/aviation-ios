//
//  ListasFijas.m
//  Aviacion
//
//  Created by Andres Abril on 5/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import "ListasFijas.h"

@implementation ListasFijas
+(NSMutableArray*)listaAmenaza{
    NSArray *namesArray = @[@"REMOTA",@"PROBABLE",@"INMINENTE"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaSupervision{
    NSArray *namesArray = @[@"ADM D/N",@"TACTICA DIA",@"TACTICA NOCHE"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaPlaneamiento{
    NSArray *namesArray = @[@"1 HORA O MÁS",@"30 MIN",@"20 MIN"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}

+(NSMutableArray*)listaDias{
    NSArray *namesArray = @[@"1 a 7",@"8 a 14",@"15 a 20",@"21 ó más"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaHoras{
    NSArray *namesArray = @[@"MÁS DE 30",@"10 a 30",@"5 a 10",@"MENOS DE 5"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaSalidaDestino{
    NSArray *namesArray = @[@"CAVOK-SCT",@"FEW-BKN",@"OBC",@"SOBRE MÍNIMOS"];
    NSArray *valuesArray = @[@1,@2,@3,@4];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaComplejidadDeLaMision{
    NSArray *namesArray = @[@"DÍA",@"NOCHE",@"IFR"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaCondicionDePista{
    NSArray *namesArray = @[@"MÁS DE 2000",@"MENOS DE 2000",@"MENOS DE 1000"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaRendimientoTripulacion{
    NSArray *namesArray = @[@"8 HORAS",@"6 A 8 HORAS",@"MENOS 6 HORAS"];
    NSArray *valuesArray = @[@1,@2,@3];
    
    return [self createArrayWithNames:namesArray andValue:valuesArray];
}
+(NSMutableArray*)listaTipoAeronave{
    NSArray *namesArray = @[@"MONOMOTOR TURBINA",@"BIMOTOR TURBINA"];
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
