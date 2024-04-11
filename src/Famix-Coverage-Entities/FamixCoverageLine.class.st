"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `file` | `FamixCoverageLine` | `lines` | `FamixCoverageFile` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `coveredBranches` | `Number` | nil | |
| `coveredInstructions` | `Number` | nil | |
| `missedBranches` | `Number` | nil | |
| `missedInstructions` | `Number` | nil | |
| `number` | `Number` | nil | |

"
Class {
	#name : #FamixCoverageLine,
	#superclass : #FamixCoverageEntity,
	#instVars : [
		'#number => FMProperty',
		'#missedInstructions => FMProperty',
		'#coveredInstructions => FMProperty',
		'#missedBranches => FMProperty',
		'#coveredBranches => FMProperty',
		'#file => FMOne type: #FamixCoverageFile opposite: #lines'
	],
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageLine class >> annotation [

	<FMClass: #Line super: #FamixCoverageEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixCoverageLine >> coveredBranches [

	<FMProperty: #coveredBranches type: #Number>
	<generated>
	^ coveredBranches
]

{ #category : #accessing }
FamixCoverageLine >> coveredBranches: anObject [
	<generated>
	coveredBranches := anObject
]

{ #category : #accessing }
FamixCoverageLine >> coveredInstructions [

	<FMProperty: #coveredInstructions type: #Number>
	<generated>
	^ coveredInstructions
]

{ #category : #accessing }
FamixCoverageLine >> coveredInstructions: anObject [
	<generated>
	coveredInstructions := anObject
]

{ #category : #accessing }
FamixCoverageLine >> file [
	"Relation named: #file type: #FamixCoverageFile opposite: #lines"

	<generated>
	^ file
]

{ #category : #accessing }
FamixCoverageLine >> file: anObject [

	<generated>
	file := anObject
]

{ #category : #accessing }
FamixCoverageLine >> missedBranches [

	<FMProperty: #missedBranches type: #Number>
	<generated>
	^ missedBranches
]

{ #category : #accessing }
FamixCoverageLine >> missedBranches: anObject [
	<generated>
	missedBranches := anObject
]

{ #category : #accessing }
FamixCoverageLine >> missedInstructions [

	<FMProperty: #missedInstructions type: #Number>
	<generated>
	^ missedInstructions
]

{ #category : #accessing }
FamixCoverageLine >> missedInstructions: anObject [
	<generated>
	missedInstructions := anObject
]

{ #category : #accessing }
FamixCoverageLine >> number [

	<FMProperty: #number type: #Number>
	<generated>
	^ number
]

{ #category : #accessing }
FamixCoverageLine >> number: anObject [
	<generated>
	number := anObject
]
