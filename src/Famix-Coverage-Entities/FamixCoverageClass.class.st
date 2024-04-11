"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `coveredClass` | `FamixCoverageClass` | `coverages` | `FamixTClass` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `branchCoverage` | `Number` | nil | |
| `classCoverage` | `Number` | nil | |
| `complexity` | `Number` | nil | |
| `instructionCoverage` | `Number` | nil | |
| `lineCoverage` | `Number` | nil | |
| `methodCoverage` | `Number` | nil | |

"
Class {
	#name : #FamixCoverageClass,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage',
	#classTraits : 'FamixCoverageTWithCoverage classTrait',
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageClass class >> annotation [

	<FMClass: #Class super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoverageClass >> coveredClass [
	"Relation named: #coveredClass type: #FamixTClass opposite: #coverages"

	<generated>
	<FMProperty: #coveredClass type: #FamixTClass opposite: #coverages>
	^ self attributeAt: #coveredClass ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixCoverageClass >> coveredClass: anObject [

	<generated>
	self attributeAt: #coveredClass put: (FMMultivalueLink on: self update: #coverages from: self coveredClass to: anObject).
]
