Class {
	#name : #NRCTasa,
	#superclass : #NRCBasics,
	#traits : 'TGeneradorNrcs',
	#classTraits : 'TGeneradorNrcs classTrait',
	#instVars : [
		'numeroJustificante'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCTasa class >> instanceWith: requestData [

	^ (self new)
		initializeWith: requestData;
		yourself 
		
	
	
	
]

{ #category : #'as yet unclassified' }
NRCTasa >> checkNumeroJustificante: unNumeroJustificante [

	unNumeroJustificante  
		ifEmpty: [ NRCErrores e107NumeroJustificanteNoInformado signal ].
	unNumeroJustificante size ~= 13
		ifTrue: [ (NRCErrores e108NumeroJustificanteLongitudIncorrecta conTextosAdicionales: { unNumeroJustificante }) signal ].
	self esNumeroJustificanteValido: unNumeroJustificante.
]

{ #category : #accessing }
NRCTasa >> entidad [ 
	
	^ self numeroJustificante copyFrom: 4 to: 7
]

{ #category : #'as yet unclassified' }
NRCTasa >> esNumeroJustificanteValido [

	| dc dcCalculado |
	dc := self numeroJustificante copyFrom: 13 to: 13.
	dcCalculado := self digitoDeControl: self numeroJustificante.
	(dc ~= dcCalculado ) 
		ifTrue: [ (NRCErrores e111numeroJustificanteInvalido conTextosAdicionales: { self numeroJustificante }) signal ].
	^ true
	
]

{ #category : #'as yet unclassified' }
NRCTasa >> esNumeroJustificanteValido: unNumeroJustificante [ 

	| dc dcCalculado |
	dc := unNumeroJustificante copyFrom: 13 to: 13.
	dcCalculado := self digitoDeControl: unNumeroJustificante.
	(dc ~= dcCalculado ) 
		ifTrue: [ NRCErrores e111numeroJustificanteInvalido conTextosAdicionales: { unNumeroJustificante } signal ]
	
]

{ #category : #initialization }
NRCTasa >> initializeWith: requestData [

	super initializeWith: requestData.
	numeroJustificante := requestData at: 'numeroJustificante' ifAbsent: [ NRCErrores e107NumeroJustificanteNoInformado signal ]
]

{ #category : #accessing }
NRCTasa >> modelo [ 

	^ self numeroJustificante copyFrom: 1 to: 3
]

{ #category : #accessing }
NRCTasa >> numeroJustificante [
	^ numeroJustificante
]

{ #category : #accessing }
NRCTasa >> numeroJustificante: unNumeroJustificante [
	numeroJustificante := unNumeroJustificante
]

{ #category : #'as yet unclassified' }
NRCTasa >> obtenerNumeroReferencia [

	"Validad datos de la petición"
	
	self checkImporte: self importe.
	self checkNif: self nif.
	self checkNumeroJustificante: self numeroJustificante.
	self checkModelo: self modelo.
	self checkEntidad: self entidad.
	
	^ self numeroJustificante , (self digitoDeControl: self numeroJustificante), self caracterDeControlComplementario 
]
