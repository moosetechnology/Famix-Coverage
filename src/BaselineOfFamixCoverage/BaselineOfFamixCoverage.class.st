Class {
	#name : #BaselineOfFamixCoverage,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixCoverage
}

{ #category : #baselines }
BaselineOfFamixCoverage >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec.
		self groups: spec ]
]

{ #category : #baselines }
BaselineOfFamixCoverage >> dependencies: spec [
]

{ #category : #baselines }
BaselineOfFamixCoverage >> groups: spec [

	spec
		group: 'default' with: #( 'model' );
		group: 'model'
		with: #( 'Famix-Coverage-Entities' 'Famix-Coverage-Generator' )
]

{ #category : #accessing }
BaselineOfFamixCoverage >> packages: spec [

	spec
		package: 'Famix-Coverage-Entities';
		package: 'Famix-Coverage-Generator'
]
