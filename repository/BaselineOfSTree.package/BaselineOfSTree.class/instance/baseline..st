baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'STree-Core'.
		spec 
			group: 'default' with: #('Core');
			group: 'Core' with: #('STree-Core')].
