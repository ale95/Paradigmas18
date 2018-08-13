puerto(piltover,runaterra).
puerto(puerto,tortuga).
viaje(abc,ruta(piltover,puerto,30),500,galeon(10)).
viaje(def,ruta(piltover,puerto,30),300,carabela(100,20)).
viaje(ghi,ruta(piltover,puerto,30),400,galera(brasil)).
capitan(jack,perlaNegra,30,50).

%1)
puedeAbordar(Capitan,CodigoViaje) :- poderioCapitan(Capitan,Poderio), resistenciaEmbarcacionViaje(CodigoViaje,Resistencia), Poderio > Resistencia.

poderioCapitan(Capitan,Poderio) :- capitan(Capitan,_,CantidadPiratas,Impetu), Poderio is (CantidadPiratas+2)*Impetu.

resistenciaEmbarcacionViaje(CodigoViaje,Resistencia) :- viaje(CodigoViaje,ruta(_,_,Distancia),Mercancia,Embarcacion), resistenciaEmbarcacion(Embarcacion,Distancia,Mercancia,Resistencia).

resistenciaEmbarcacion(galeon(CantidadCaniones),Distancia,_,Resistencia) :- Resistencia is CantidadCaniones*100/Distancia.
resistenciaEmbarcacion(carabela(_,CantidadSoldados),_,Mercancia,Resistencia) :- Resistencia is (Mercancia / 10) + CantidadSoldados.
resistenciaEmbarcacion(galera(espania),Distancia,_,Resistencia) :- Resistencia is 100/Distancia.
resistenciaEmbarcacion(galera(Pais),_,Mercancia,Resistencia) :- Resistencia is Mercancia*10.

%2)
botinCapitan(Puerto,Botin) :- mercanciasPuerto(Puerto,ListaMercancias), sumlist(ListaMercancias,Botin).
mercanciasPuerto(Puerto,ListaMercancias) :- puerto(Puerto,_), findall(Mercancia,viaje(_,ruta(Puerto,_,_),Mercancia,_),PrimerLista), findall(Mercancia,viaje(_,ruta(_,Puerto,_),Mercancia,_),SegundaLista), append(PrimerLista,SegundaLista,ListaMercancias).

%3)
decadente(Capitan) :- capitan(Capitan,_,CantidadPiratas,_), not(puedeAbordar(Capitan,_)), CantidadPiratas < 10.

terrorDelPuerto(Capitan) :- poderioCapitan(Capitan,Poderio), puerto(Puerto,_), puedeAbordarPuerto(Puerto,Poderio).

puedeAbordarPuerto(Puerto,Poderio) :- forall(viaje(_,ruta(Puerto,_,Distancia),Mercancia,Embarcacion),poderioResistencia(Embarcacion,Distancia,Mercancia,Poderio)), forall(viaje(_,ruta(_,Puerto,Distancia),Mercancia,Embarcacion),poderioResistencia(Embarcacion,Distancia,Mercancia,Poderio)).

poderioResistencia(Embarcacion,Distancia,Mercancia,Poderio) :- resistenciaEmbarcacion(Embarcacion,Distancia,Mercancia,Resistencia), Poderio > Resistencia.

%4)