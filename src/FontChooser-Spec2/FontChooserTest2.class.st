Class {
	#name : #FontChooserTest2,
	#superclass : #TestCase,
	#instVars : [
		'chooser'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #tests }
FontChooserTest2 >> setUp [
	
	chooser := FontChooser new.
	chooser fontList: LogicalFontManager current defaultFamilies.

]

{ #category : #tests }
FontChooserTest2 >> testFontList [
	
	self deny: chooser fontList isEmpty.
	self assert: chooser fontList first familyName equals: LogicalFontManager current defaultFamilies first familyName
	
]

{ #category : #tests }
FontChooserTest2 >> testFontListStrings [

	self deny: chooser fontListStrings isEmpty.
	self 
		assert: chooser fontListStrings 
		equals: (LogicalFontManager current defaultFamilies collect: [ :each | each familyName ]) 
]
