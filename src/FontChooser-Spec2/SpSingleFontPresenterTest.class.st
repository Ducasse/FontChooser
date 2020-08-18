Class {
	#name : #SpSingleFontPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #running }
SpSingleFontPresenterTest >> setUp [ 
	
	presenter := SpSingleFontPresenter on: LogicalFontManager new defaultFamilies first.
	
]

{ #category : #tests }
SpSingleFontPresenterTest >> testStyleIsDisplayed [
	
	self assert: presenter fontStyleList items size equals: #('Regular' 'Italic' 'Bold' 'Bold Italic') size
]
