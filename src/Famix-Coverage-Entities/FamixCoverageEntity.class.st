Class {
	#name : #FamixCoverageEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Coverage-Entities-Entities'
}

{ #category : #meta }
FamixCoverageEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Coverage-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixCoverageEntity class >> isAbstract [

	<generated>
	^ self == FamixCoverageEntity
]

{ #category : #meta }
FamixCoverageEntity class >> metamodel [

	<generated>
	^ FamixCoverageModel metamodel
]
