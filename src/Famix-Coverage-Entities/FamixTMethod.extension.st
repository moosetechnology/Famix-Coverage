Extension { #name : #FamixTMethod }

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTMethod >> coverages [
	"Relation named: #coverages type: #FamixCoverageMethod opposite: #coveredMethod"

	<generated>
	<derived>
	<FMProperty: #coverages type: #FamixCoverageMethod opposite: #coveredMethod>
	<package: #'Famix-Coverage-Entities'>
	^ self attributeAt: #coverages ifAbsentPut: [ FMMultivalueLink on: self opposite: #coveredMethod: ]
]

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTMethod >> coverages: anObject [

	<generated>
	self coverages value: anObject
]
