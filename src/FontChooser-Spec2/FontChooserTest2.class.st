Class {
	#name : #FontChooserTest2,
	#superclass : #TestCase,
	#category : #'FontChooser-Spec2'
}

{ #category : #tests }
FontChooserTest2 >> testFontList [
	
	| chooser |
	chooser := FontChooser new.
	self deny: chooser fontList isEmpty.
	self assert: chooser fontList first familyName equals: LogicalFontManager current allFamilies first familyName
	
]

{ #category : #tests }
FontChooserTest2 >> testFontListStrings [
	
	| chooser |
	chooser := FontChooser new.
	self deny: chooser fontListStrings isEmpty.
	self assert: chooser fontListStrings equals: 
	(LogicalFontManager current allFamilies collect: [ :each | each familyName ]) 
]
