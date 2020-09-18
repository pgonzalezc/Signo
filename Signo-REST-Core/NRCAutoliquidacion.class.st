Class {
	#name : #NRCAutoliquidacion,
	#superclass : #NRCBasics,
	#traits : 'TGeneradorNrcs',
	#classTraits : 'TGeneradorNrcs classTrait',
	#instVars : [
		'ejercicio',
		'periodo'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #'as yet unclassified' }
NRCAutoliquidacion class >> instanceWith: requestData [

	^ (self new)
		initializeWith: requestData;
		yourself
]

{ #category : #initialization }
NRCAutoliquidacion >> initializeWith: requestData [

	super initializeWith: requestData.
	ejercicio := requestData at: #ejercicio ifAbsent: ''.
	periodo := requestData at: #periodo ifAbsent: ''
]

{ #category : #accessing }
NRCAutoliquidacion >> numeroJustificante [ 

	^ self modelo, self entidad, (self numeroSecuencial: 6)
]

{ #category : #'as yet unclassified' }
NRCAutoliquidacion >> obtenerNumeroReferencia [

	^ '444456789012', (self digitoDeControl: self numeroJustificante) , self caracterDeControlComplementario 
]
