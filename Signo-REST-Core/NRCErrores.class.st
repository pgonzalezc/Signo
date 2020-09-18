Class {
	#name : #NRCErrores,
	#superclass : #Object,
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCErrores class >> e100ParametroNrcLongitudIncorrecta [

	"100 - Parámetro nrc [{1}] con longitud incorrecta. Nrc debe ser de 22 caracteres"
	^ NRCError codigo: 100 descripcion: 'Parámetro nrc [{1}] con longitud incorrecta. Nrc debe ser de 22 caracteres'.
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e101ParametroNrcNoInformado [

	"101 - parametro NRC no informado. Es obligatorio"
	^ NRCError codigo: 101 descripcion: 'parametro NRC no informado. Es obligatorio'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e102ParametroEntidadLongitudIncorrecta [

	"102 - Parámetro entidad [{1}] longitud incorrecta. Debe tener cuatro caracteres"
	^ NRCError codigo: 102 descripcion: 'Parámetro entidad [{1}] longitud incorrecta. Debe tener cuatro caracteres'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e103TipoServicioNoDisponible [

	"103 - tipo de servicio {1} no disponible"
	^ NRCError codigo: 103 descripcion: 'Tipo de servicio [{1}] no disponible'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e104ModeloLongitudIncorrecta [

	"104 - Modelo {1} de longitud incorrecta. Debe tener 3 caracteres"
	
	^ NRCError codigo: 104 descripcion: 'Modelo {1} de longitud incorrecta. Debe tener 3 caracteres'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e105ImporteIncorrecto [

	"105 - Importe {1} Incorrecto. Debe ser superior a 0"
	^ NRCError codigo: 105 descripcion: 'Importe {1} Incorrecto. Debe ser superior a 0'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e106NifLongitudIncorrecta [

	"106 - Nif {1} con longitud incorrecta. Debe tener 9 caracteres"
	^ NRCError codigo: 106 descripcion: 'Nif {1} con longitud incorrecta. Debe tener 9 caracteres'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e107NumeroJustificanteNoInformado [
	
	"107 - Número de referencia no informado. Obligatorio para tasas"
	^ NRCError codigo: 107 descripcion: 'Número de referencia no informado. Obligatorio para tasas'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e108NumeroJustificanteLongitudIncorrecta [

	"108 - Número de referencia {1} con longitud incorrecta. Debe tener 13 caracteres"
	^ NRCError codigo: 108 descripcion: 'Número de referencia {1} con longitud incorrecta. Debe tener 13 caracteres'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e109FechaNoInformada [

	"109 - Fecha no informada. Es obligatoria"
	^ NRCError codigo: 109 descripcion: 'Fecha no informada. Es obligatoria'
]

{ #category : #'as yet unclassified' }
NRCErrores class >> e110FechaFormatoIncorrecto [

	"110 - Fecha {1} con formato incorrecto. El formato debe ser YYYY-MM-DD HH:MM:SS"
	^ NRCError codigo: 110 descripcion: 'Fecha {1} con formato incorrecto. El formato debe ser YYYY-MM-DD HH:MM:SS'
]
