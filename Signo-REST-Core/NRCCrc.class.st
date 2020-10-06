Class {
	#name : #NRCCrc,
	#superclass : #Object,
	#classVars : [
		'TablaCrc'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #private }
NRCCrc class >> cargaTablaCrc [

	| polinomio |
	polinomio := 16r07.
	TablaCrc ifNil: [ 
		TablaCrc := ByteArray new: 256.
		0 to: 255 do: [ :each || j |
			j := each.
			8 timesRepeat: [ j := (j > 127) ifTrue: [((j << 1) bitAnd: 16rFF) bitXor: polinomio] ifFalse: [j << 1]].
			TablaCrc byteAt: (each + 1) put: j.
		 ]].
	^ TablaCrc
]

{ #category : #'as yet unclassified' }
NRCCrc class >> crc5: aByteArray [

	| crc |
	TablaCrc ifNil: [ self cargaTablaCrc ].
	crc := 0.
	1 to: aByteArray size do: [ :each || c j |
		c :=  aByteArray byteAt: each.
		j := (crc bitXor: c) bitAnd: 16r1F.
		crc := (TablaCrc byteAt: j + 1) bitAnd: 16r1F
	].
	^ 'BK3JNHSQF76YCG2EZVDRUX4TPAI5LMWO9' at: crc + 1
]

{ #category : #initialization }
NRCCrc class >> reset [ 
	
	TablaCrc := nil
]
