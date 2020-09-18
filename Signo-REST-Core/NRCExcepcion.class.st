Class {
	#name : #NRCExcepcion,
	#superclass : #Error,
	#instVars : [
		'codigo',
		'descripcion'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCExcepcion class >> conCodigo: unEntero descripcion: unaCadena [

	^ (self new)
		codigo: unEntero;
		descripcion: unaCadena
]

{ #category : #accessing }
NRCExcepcion >> codigo [
	^ codigo
]

{ #category : #accessing }
NRCExcepcion >> codigo: anObject [
	codigo := anObject
]

{ #category : #accessing }
NRCExcepcion >> descripcion [
	^ descripcion
]

{ #category : #accessing }
NRCExcepcion >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #printing }
NRCExcepcion >> printOn: aStream [

	aStream 
		nextPutAll: self codigo asString;
		nextPutAll: ': ';
		nextPutAll: self descripcion
	
]
