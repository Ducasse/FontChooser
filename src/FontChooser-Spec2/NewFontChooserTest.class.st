Class {
	#name : #NewFontChooserTest,
	#superclass : #TestCase,
	#instVars : [
		'chooser'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #tests }
NewFontChooserTest >> setUp [
	
	chooser := NewFontChooser new.
	chooser fontList: LogicalFontManager current defaultFamilies.
	"this is equivalent to FontChooser newWithDefaultFamilies"

]

{ #category : #tests }
NewFontChooserTest >> testFontList [
	
	self deny: chooser fontList isEmpty.
	self 
		assert: chooser fontList first familyName 
		equals: LogicalFontManager current defaultFamilies first familyName
	
]
