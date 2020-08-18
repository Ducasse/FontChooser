Extension { #name : #FontChooser }

{ #category : #'*FontChooser-Spec2' }
FontChooser >> fontList: aFontList [
	
	fontList := aFontList
]

{ #category : #'*FontChooser-Spec2' }
FontChooser >> fontListStrings: aFontList [
	
	fontListStrings := aFontList
]

{ #category : #'*FontChooser-Spec2' }
FontChooser class >> newWithDefaultFamilies [

   ^ self new fontList: LogicalFontManager current defaultFamilies; yourself
]
