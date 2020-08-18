Class {
	#name : #FontChooserTest3,
	#superclass : #TestCase,
	#instVars : [
		'chooser'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #running }
FontChooserTest3 >> setUp [
	
	chooser := FontChooser new.
	chooser fontListStrings: LogicalFontManager current defaultFamilies.
]

{ #category : #tests }
FontChooserTest3 >> testFontSizeList [
	
	self deny: chooser pointSizeList isEmpty.
	self 
		assert: chooser pointSizeList
		equals: (LogicalFontManager current defaultFamilies collect: [ :each | each familyName ]) 
	
]
