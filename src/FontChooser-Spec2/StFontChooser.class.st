"
With the old model (it will not work soon). 
```
(StFontChooser on: FontChooser new) openWithSpec
```

```
(StFontChooser on: FontChooser new) 
	setter: #menuFont:;
	getter: #menuFont;
	openWithSpec
```

For example to work on a subset of fonts, provide a specific font chooser as follows:

```
(StFontChooser on: NewFontChooserModel newWithDefaultFamilies) openWithSpec
```


It should probably be used as follows but I'm not sure. 

```
StandardFonts menuFont: (StFontChooser on: FontChooser new) openWithSpec
```

The old way to open the font chooset is 
```
To open the old font chooser morph

FontChooser
 openWithWindowTitle: 'Choose the Menu Font'
 for: StandardFonts
 setSelector: #menuFont:
 getSelector: #menuFont
```

Then I will have to study

```
FreeTypeFontSelectorDialogWindow new open
```

"
Class {
	#name : #StFontChooser,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'fontFamilyList',
		'fontStyleList',
		'fontSizeList',
		'currentFontStyleIndex',
		'currentFontStyleValue',
		'fontSize',
		'languageList',
		'renderingResult',
		'buttonBar',
		'setterSymbol',
		'getterSymbol',
		'target'
	],
	#category : #'FontChooser-Spec2'
}

{ #category : #specs }
StFontChooser class >> defaultSpec [ 

	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal 
					add: #fontFamilyList;
					add: #fontStyleList;
					add: #fontSizeList;
					add: #languageList;
					yourself);
		add: #renderingResult;
					
		yourself
			
]

{ #category : #initialization }
StFontChooser >> connectPresenters [ 
	
	fontFamilyList 
		whenSelectionChangedDo: [ :selection | 
			selection selectedItem
				ifNotNil: [ :family | 
						self storeCurrentFontStyleValue.
						fontStyleList items: family members asSortedCollection.
						self refreshFontStyleList  ]
						]
]

{ #category : #'font style list' }
StFontChooser >> firstFontStyleValue [ 
	"when there is no element that correspond to the previous selection, return the default value"
	
	^ 'Regular'	
				
]

{ #category : #accessing }
StFontChooser >> fontFamilyList [ 
	
	^ fontFamilyList 

]

{ #category : #accessing }
StFontChooser >> fontSizeList [ 
	
	^ fontSize

]

{ #category : #accessing }
StFontChooser >> fontStyleList [

	^ fontStyleList
]

{ #category : #accessing }
StFontChooser >> for: anObject [
	"Specify which object will see its font modified via the getter and setter symbol selector. "
	
	target := anObject
]

{ #category : #accessing }
StFontChooser >> getter: aGetterSymbol [
	"This the selector (e.g., menuFont) of the message that will be sent to the object whose font will be modified on apply."
	
	getterSymbol := aGetterSymbol
]

{ #category : #initialization }
StFontChooser >> initializePresenters [ 
	
	fontFamilyList := self newList.
	fontFamilyList display: [ :each | each familyName ].
	
	fontStyleList := self newList.
	fontStyleList display: [ :familyMember |  
			| styleName |

			styleName := familyMember styleName.
			familyMember simulated
				ifTrue: ['(', styleName, ')']
				ifFalse: [styleName] ].
			
			
	fontSizeList := self newList.
	fontSizeList display: [ :familyMember2 |  
			| size |
			size := familyMember2 size.
			familyMember2 simulated
				ifTrue: ['(', size, ')']
				ifFalse: [size] ].
			
	languageList := self newList. 
	
	renderingResult := self newText.
	
	buttonBar := self newButtonBar
	

]

{ #category : #initialization }
StFontChooser >> initializeWindow: aWindowPresenter [

	aWindowPresenter initialExtent: 900 @ 530.
	aWindowPresenter title: self title
]

{ #category : #initialization }
StFontChooser >> modelChanged [  
	
	fontFamilyList items: self model fontList.
	fontFamilyList selectIndex: 1.
	

]

{ #category : #'font style list' }
StFontChooser >> refreshFontStyleList [
								
	| fontStyle |
	"the display logic displays (Oblique) and the font does not store (Oblique) but Oblique.
	So we have to remove the parentheses if we want to find and select the correct Oblique."
	
	fontStyle := fontStyleList items detect: [ :aFontStyle | 
			| previousWithoutParentheses |
			previousWithoutParentheses := currentFontStyleValue copy.
			previousWithoutParentheses first = $(
				ifTrue: [ previousWithoutParentheses := previousWithoutParentheses copyFrom: 2 to: previousWithoutParentheses size - 1 ].
			aFontStyle styleName = previousWithoutParentheses ] ifNone: [ nil ].
	fontStyle ifNil: [ "could not work when there are not fontStyles"
							fontStyleList selectIndex: 1 ]
				ifNotNil: [ fontStyleList selectItem: fontStyle  ]
]

{ #category : #accessing }
StFontChooser >> selector: aSymbol [
	"From this selector we will derive getter and setter (e.g., menuFont: and menuFont) of the message that will be sent to the object whose font will be modified on apply."
	
	setterSymbol := (#':' , aSymbol) asSymbol.
	getterSymbol := aSymbol
]

{ #category : #accessing }
StFontChooser >> setter: aSetterSymbol [
	"This the selector (e.g., menuFont:) of the message that will be sent to the object whose font will be modified on apply."
	
	setterSymbol := aSetterSymbol
]

{ #category : #'font style list' }
StFontChooser >> storeCurrentFontStyleValue [ 

	currentFontStyleValue := fontStyleList selection isEmpty
		ifTrue: [ self firstFontStyleValue ]
		ifFalse: [  fontStyleList displayValueFor: (fontStyleList selection selectedItem)]. 
]

{ #category : #initialization }
StFontChooser >> title [ 

	^ 'Font Chooser'
]
