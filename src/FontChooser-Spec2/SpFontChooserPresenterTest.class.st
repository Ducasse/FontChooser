Class {
	#name : #SpFontChooserPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #tests }
SpFontChooserPresenterTest >> setUp [

	presenter := SpFontChooserPresenter on: (FontChooser new fontList: LogicalFontManager current defaultFamilies).
	
]

{ #category : #tests }
SpFontChooserPresenterTest >> testFamilyListCorrect [

	self deny: presenter fontFamilyList items isEmpty.
	self assert: presenter fontFamilyList items size equals: 3.
	self assert: presenter fontFamilyList selectedItems equals: #().
]
