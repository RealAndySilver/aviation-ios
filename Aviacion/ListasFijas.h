//
//  ListasFijas.h
//  Aviacion
//
//  Created by Andres Abril on 5/12/15.
//  Copyright © 2015 iAmStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListasFijas : NSObject

+(NSMutableArray*)listaAmenazaAlaFija;
+(NSMutableArray*)listaSupervisionAlaFija;
+(NSMutableArray*)listaPlaneamientoAlaFija;
+(NSMutableArray*)listaDiasAlaFija;
+(NSMutableArray*)listaHorasAlaFija;
+(NSMutableArray*)listaSalidaDestinoAlaFija;
+(NSMutableArray*)listaComplejidadDeLaMisionAlaFija;
+(NSMutableArray*)listaCondicionDePistaAlaFija;
+(NSMutableArray*)listaRendimientoTripulacionAlaFija;
+(NSMutableArray*)listaTipoAeronaveAlaFija;

+(NSMutableArray*)listaAmenazaAlaRotatoria;
+(NSMutableArray*)listaSupervisionAlaRotatoria;
+(NSMutableArray*)listaPlaneamientoAlaRotatoria;
+(NSMutableArray*)listaDiasDisponibilidadDeVueloAlaRotatoria;
+(NSMutableArray*)listaExperienciaPAMAlaRotatoria;
+(NSMutableArray*)listaExperienciaPAlaRotatoria;
+(NSMutableArray*)listaExperienciaTripulanteAdicionalAlaRotatoria;
+(NSMutableArray*)listaDiasSinRealisarElMismoTipoAlaRotatoria;
+(NSMutableArray*)listaRendimientoTripulacionAlaRotatoria;
+(NSMutableArray*)listaCondicionesMeteorologicasAlaRotatoria;
+(NSMutableArray*)listaComplejidadAlaRotatoria;
+(NSMutableArray*)listaFactoresGeograficosAlaRotatoria;
+(NSMutableArray*)listaSeleccionAlaRotatoria;
+(NSMutableArray*)listaPorcentajeIluminacionAlaRotatoria;
+(NSMutableArray*)listaAnguloLunaAlaRotatoria;
@end
