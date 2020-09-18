Class {
	#name : #NRCAval,
	#superclass : #NRCBasics,
	#traits : 'TFechable + TGeneradorNrcs',
	#classTraits : 'TFechable classTrait + TGeneradorNrcs classTrait',
	#instVars : [
		'codigoAval',
		'fecha'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCAval class >> instanceWith: requestData [

	 ^ (self new)
		initializeWith: requestData;
		yourself
]

{ #category : #accessing }
NRCAval >> codigoAval [
	^ codigoAval
]

{ #category : #accessing }
NRCAval >> codigoAval: anObject [
	codigoAval := anObject
]

{ #category : #accessing }
NRCAval >> fecha [
	^ fecha
]

{ #category : #accessing }
NRCAval >> fecha: anObject [
	fecha := anObject
]

{ #category : #initialization }
NRCAval >> initializeWith: requestData [

	super initializeWith: requestData.
	codigoAval := requestData at: #codigoAval ifAbsent: ''.
	fecha := requestData at: #fecha ifAbsent: DateAndTime now
]

{ #category : #accessing }
NRCAval >> numeroJustificante [ 

	^ self modelo, self entidad, (self numeroSecuencial: 6)
]

{ #category : #'as yet unclassified' }
NRCAval >> obtenerNumeroReferencia [

	^ '111456789012', (self digitoDeControl: self numeroJustificante) , self caracterDeControlComplementario 
]

{ #category : #classification }
NRCAval >> tipoFecha [

	^ 'fecha de ingreso'
]
