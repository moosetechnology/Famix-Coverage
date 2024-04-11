Class {
	#name : #FamixCoverageModel,
	#superclass : #MooseModel,
	#traits : 'FamixCoverageTEntityCreator',
	#classTraits : 'FamixCoverageTEntityCreator classTrait',
	#category : #'Famix-Coverage-Entities-Model'
}

{ #category : #accessing }
FamixCoverageModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixCoverageModel class >> annotation [
	<FMClass: #FamixCoverageModel super: #MooseModel>
	<package: #'Famix-Coverage-Entities'>
	<generated>
]
