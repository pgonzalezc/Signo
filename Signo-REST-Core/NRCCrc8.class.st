Class {
	#name : #NRCCrc8,
	#superclass : #Object,
	#classVars : [
		'TablaCrc'
	],
	#category : #'Signo-REST-Core'
}

{ #category : #initialization }
NRCCrc8 class >> reset [ 
	
	TablaCrc := nil
]

{ #category : #'as yet unclassified' }
NRCCrc8 >> crc8: aByteArray [

	| crc |
	crc := 0.
	1 to: aByteArray size do: [ :each |  crc := self tablaCrc byteAt: ((crc bitXor: (aByteArray byteAt: each)) bitAnd: 16rFF) ].
	^ 'BK3JNHSQF76YCG2EZVDRUX4TPAI5LMWO9' at: crc + 1
]

{ #category : #'as yet unclassified' }
NRCCrc8 >> tablaCrc [

	| polinomio |
	polinomio := 16r07.
	TablaCrc ifNil: [ 
		TablaCrc := ByteArray new: 256.
		0 to: 255 do: [ :each || j |
			j := each.
			0 to: 7 do: [ :k |  j := (j < 0) ifTrue: [(j << 1) bitXor: (polinomio bitAnd: 16rFF)] ifFalse: [j << 1]].
			TablaCrc byteAt: (each + 1) put: (j % 255).
		 ]].
	^ TablaCrc
]
