persona(bart).
persona(larry).
persona(otto).
persona(marge).

persona(alMando(burns,29)).
persona(alMando(clark,20).
persona(novato(lenny)).
persona(novato(carl)).
persona(elElegido(homero)).

hijo(homero,abbe).
hijo(bart,homero).
hijo(larry,burns).

salvo(carl,lenny).
salvo(homero,larry).
salvo(otto,burns).

gozaBeneficio(carl, confort(sillon)).
gozaBeneficio(lenny, confort(sillon)).
gozaBeneficio(lenny, confort(estacionamiento, techado)).
gozaBeneficio(carl, confort(estacionamiento, libre)).
gozaBeneficio(clark, confort(viajeSinTráfico)).
gozaBeneficio(clark, dispersion(fiestas)).
gozaBeneficio(burns, dispersion(fiestas)).
gozaBeneficio(lenny, economico(descuento, 500)).

%1%

aspiranteMagio(Persona) :- 