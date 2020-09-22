Class {
	#name : #NRCLiquidacion,
	#superclass : #NRCBasics,
	#traits : 'TGeneradorNrcs',
	#classTraits : 'TGeneradorNrcs classTrait',
	#instVars : [
		'numeroJustificante',
		'fecha'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCLiquidacion class >> instanceWith: requestData [

	^ (self new)
		initializeWith: requestData;
		yourself 
]

{ #category : #'as yet unclassified' }
NRCLiquidacion >> checkFecha: unaFecha [

	unaFecha 
		ifEmpty: [ NRCErrores e109FechaNoInformada signal ].
	(unaFecha matchesRegex: '(\d\d\d\d)-(\d\d)-(\d\d)\s(\d\d)\:(\d\d)\:(\d\d)')
		ifFalse: [ (NRCErrores e110FechaFormatoIncorrecto conTextosAdicionales: { unaFecha }) signal ]
]

{ #category : #'as yet unclassified' }
NRCLiquidacion >> checkNumeroJustificante: unNumeroJustificante [ 

	unNumeroJustificante 
		ifEmpty: [ NRCErrores e107NumeroJustificanteNoInformado signal ].
	unNumeroJustificante size ~= 13
		ifTrue: [ (NRCErrores e108NumeroJustificanteLongitudIncorrecta conTextosAdicionales: {  unNumeroJustificante  }) signal ]
]

{ #category : #accessing }
NRCLiquidacion >> fecha [
	^ fecha
]

{ #category : #accessing }
NRCLiquidacion >> fecha: anObject [
	fecha := anObject
]

{ #category : #initialization }
NRCLiquidacion >> initializeWith: requestData [

	super initializeWith: requestData.
	numeroJustificante := requestData at: 'numeroJustificante' ifAbsent: ''.
	fecha := requestData at: 'fecha' ifAbsent: ''
]

{ #category : #accessing }
NRCLiquidacion >> modelo [

	^ self numeroJustificante 
		ifEmpty: [ '' ]
		ifNotEmpty: [ self numeroJustificante copyFrom: 1 to: 3 ]
]

{ #category : #accessing }
NRCLiquidacion >> numeroJustificante [
	^ (numeroJustificante copyFrom: 1 to: 12), '0'
]

{ #category : #accessing }
NRCLiquidacion >> numeroJustificante: anObject [
	numeroJustificante := anObject
]

{ #category : #'as yet unclassified' }
NRCLiquidacion >> obtenerNumeroReferencia [

	"Validamos los datos de la petición"
	self checkNumeroJustificante: self numeroJustificante.
	self checkFecha: self fecha.
	self checkEntidad: self entidad.
	self checkImporte: self importe.
	self checkModelo: self modelo.
	self checkNif: self nif.

	^ '333456789012', (self digitoDeControl: self numeroJustificante) , (self caracterDeControlComplementario)
]
