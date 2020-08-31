"
I'm a new model for the font chooser. 
I'm responsible for computing some default information about the fonts and keeping a list of pangrams.


"
Class {
	#name : #NewFontChooserModel,
	#superclass : #Model,
	#instVars : [
		'fontList'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #'instance creation' }
NewFontChooserModel class >> newWithDefaultFamilies [

   ^ self new fontList: LogicalFontManager current defaultFamilies; yourself
]

{ #category : #accessing }
NewFontChooserModel >> fontList [
	^ fontList
]

{ #category : #accessing }
NewFontChooserModel >> fontList: aCollection [ 
	fontList := aCollection
]
