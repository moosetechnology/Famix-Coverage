Extension { #name : #FamixTPackage }

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTPackage >> coverages [
	"Relation named: #coverages type: #FamixCoveragePackage opposite: #coveredPackage"

	<generated>
	<derived>
	<FMProperty: #coverages type: #FamixCoveragePackage opposite: #coveredPackage>
	<package: #'Famix-Coverage-Entities'>
	^ self attributeAt: #coverages ifAbsentPut: [ FMMultivalueLink on: self opposite: #coveredPackage: ]
]

{ #category : #'*Famix-Coverage-Entities-accessing' }
FamixTPackage >> coverages: anObject [

	<generated>
	self coverages value: anObject
]
