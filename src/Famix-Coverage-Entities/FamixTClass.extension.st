Extension { #name : #FamixTClass }

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTClass >> coverages [
	"Relation named: #coverages type: #FamixCoverageClass opposite: #coveredClass"

	<generated>
	<derived>
	<FMProperty: #coverages type: #FamixCoverageClass opposite: #coveredClass>
	<package: #'Famix-Coverage-Entities'>
	^ self attributeAt: #coverages ifAbsentPut: [ FMMultivalueLink on: self opposite: #coveredClass: ]
]

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTClass >> coverages: anObject [

	<generated>
	self coverages value: anObject
]
