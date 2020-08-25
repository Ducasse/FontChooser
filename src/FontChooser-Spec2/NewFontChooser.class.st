Class {
	#name : #NewFontChooser,
	#superclass : #Model,
	#instVars : [
		'fontList'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #'instance creation' }
NewFontChooser class >> newWithDefaultFamilies [

   ^ self new fontList: LogicalFontManager current defaultFamilies; yourself
]

{ #category : #accessing }
NewFontChooser >> fontList [
	^ fontList
]

{ #category : #accessing }
NewFontChooser >> fontList: aCollection [ 
	fontList := aCollection
]
