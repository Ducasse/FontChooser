"
To open the old font chooser morph

```
FontChooser
	openWithWindowTitle: 'Choose the Menu Font'
	for: StandardFonts
	setSelector: #menuFont:
	getSelector: #menuFont

```
"
Class {
	#name : #FontChooserTest,
	#superclass : #TestCase,
	#instVars : [
		'chooser'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #tests }
FontChooserTest >> setUp [
	
	chooser := FontChooser new.
	chooser fontList: LogicalFontManager current defaultFamilies.
	"this is equivalent to FontChooser newWithDefaultFamilies"

]

{ #category : #tests }
FontChooserTest >> testFontList [
	
	self deny: chooser fontList isEmpty.
	self assert: chooser fontList first familyName equals: LogicalFontManager current defaultFamilies first familyName
	
]

{ #category : #tests }
FontChooserTest >> testFontListStrings [

	self deny: chooser fontListStrings isEmpty.
	self 
		assert: chooser fontListStrings
		equals: (LogicalFontManager current defaultFamilies collect: [ :each | each familyName ]) 
]

{ #category : #tests }
FontChooserTest >> testPointSizeList [

	chooser selectedFontIndex: 1.
	chooser selectedFontStyleIndex
	self 
		assert: chooser pointSizeList
		equals: 3
]

{ #category : #tests }
FontChooserTest >> testPointSizeListIsSet [
	self skip
	"chooser setPointSizeListFrom: chooser fontList first.
	self halt.
	self 
		assert: chooser pointSizeList
		equals: 'no idea how the point size list is computer from the familie see later'"
	
]
