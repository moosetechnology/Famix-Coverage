"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `coveredMethod` | `FamixCoverageMethod` | `coverages` | `FamixTMethod` | |


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
	#name : #FamixCoverageMethod,
	#superclass : #FamixCoverageEntity,
	#traits : 'FamixCoverageTWithCoverage',
	#classTraits : 'FamixCoverageTWithCoverage classTrait',
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageMethod class >> annotation [

	<FMClass: #Method super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoverageMethod >> coveredMethod [
	"Relation named: #coveredMethod type: #FamixTMethod opposite: #coverages"

	<generated>
	<FMProperty: #coveredMethod type: #FamixTMethod opposite: #coverages>
	^ self attributeAt: #coveredMethod ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixCoverageMethod >> coveredMethod: anObject [

	<generated>
	self attributeAt: #coveredMethod put: (FMMultivalueLink on: self update: #coverages from: self coveredMethod to: anObject).
]
