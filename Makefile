run:
	helm dependency update amsterdam
	helm dependency build amsterdam
	helm template --debug amsterdam

