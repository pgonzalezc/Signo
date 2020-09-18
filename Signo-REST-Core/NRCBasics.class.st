Class {
	#name : #NRCBasics,
	#superclass : #Object,
	#traits : 'TGeneradorNrcs',
	#classTraits : 'TGeneradorNrcs classTrait',
	#instVars : [
		'entidad',
		'modelo',
		'importe',
		'nif'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCBasics class >> instanceWith: requestData [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
NRCBasics >> checkEntidad: unaEntidad [

	self entidad size ~= 4
		ifTrue: [ (NRCErrores e102ParametroEntidadLongitudIncorrecta conTextosAdicionales: { unaEntidad }) signal ]
]

{ #category : #'as yet unclassified' }
NRCBasics >> checkImporte: unImporte [

	self importe <= 0
		ifTrue: [ (NRCErrores e105ImporteIncorrecto conTextosAdicionales: { unImporte }) signal ]
]

{ #category : #'as yet unclassified' }
NRCBasics >> checkModelo: unModelo [

	self modelo size ~= 3
		ifTrue: [ (NRCErrores e104ModeloLongitudIncorrecta conTextosAdicionales: {  unModelo }) signal ]
]

{ #category : #'as yet unclassified' }
NRCBasics >> checkNif: unNif [

	self nif size ~= 9
		ifTrue: [ (NRCErrores e106NifLongitudIncorrecta conTextosAdicionales: { unNif }) signal ]
]

{ #category : #accessing }
NRCBasics >> entidad [
	^ entidad
]

{ #category : #accessing }
NRCBasics >> entidad: anObject [
	entidad := anObject
]

{ #category : #accessing }
NRCBasics >> importe [
	^ importe
]

{ #category : #accessing }
NRCBasics >> importe: anObject [
	importe := anObject
]

{ #category : #initialization }
NRCBasics >> initializeWith: requestData [

	entidad := requestData at: 'entidad' ifAbsent: ''.
	modelo := requestData at: 'modelo' ifAbsent: ''.
	nif := requestData at: 'nif' ifAbsent: ''.
	importe := requestData at: 'importe' ifAbsent: 0.0
]

{ #category : #accessing }
NRCBasics >> modelo [
	^ modelo
]

{ #category : #accessing }
NRCBasics >> modelo: anObject [
	modelo := anObject
]

{ #category : #accessing }
NRCBasics >> nif [
	^ nif
]

{ #category : #accessing }
NRCBasics >> nif: anObject [
	nif := anObject
]
