.PHONY = deploy
capabilities = CAPABILITY_IAM
bucket = s3-sam-lambda
s3prefix = builds
region = us-east-1
directory = .aws-sam
generatedTemplateFile = ${directory}/template-generated.yaml

deploy: | $(directory)
	sam build
	sam package --s3-bucket ${bucket} \
		--s3-prefix ${s3prefix} \
		--output-template-file ${generatedTemplateFile} \
		--region ${region} 
	sam deploy --template-file ${generatedTemplateFile} \
	--stack-name samTest \
	--capabilities ${capabilities} \



