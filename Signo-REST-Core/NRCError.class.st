Class {
	#name : #NRCError,
	#superclass : #Object,
	#instVars : [
		'codigo',
		'descripcion'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #creating }
NRCError class >> codigo: unCodigo descripcion: unaCadena [

	^ (self new)
		codigo: unCodigo;
		descripcion: unaCadena
		
]

{ #category : #accessing }
NRCError >> codigo [
	^ codigo
]

{ #category : #accessing }
NRCError >> codigo: anObject [
	codigo := anObject
]

{ #category : #'as yet unclassified' }
NRCError >> conTextosAdicionales: unArrayDeCadenas [

	^ self copy
		descripcion: (self descripcion format: unArrayDeCadenas) 
	
]

{ #category : #accessing }
NRCError >> descripcion [
	^ descripcion
]

{ #category : #accessing }
NRCError >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #printing }
NRCError >> printOn: aStream [

	aStream 
		nextPutAll: codigo asString;
		nextPutAll: ' - ';
		nextPutAll: descripcion
]

{ #category : #accessing }
NRCError >> signal [ 

	(NRCExcepcion conCodigo: self codigo descripcion: self descripcion) signal
]
