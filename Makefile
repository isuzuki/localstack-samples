.PHONY: create update exec zip

zip:
	zip lambda.zip index.js

create: zip
	aws lambda --endpoint-url=http://localhost:4574 --profile localstack create-function --function-name=f1 --runtime=nodejs8.10 --role=r1 --handler=index.handler --zip-file fileb://lambda.zip

update: zip
	aws lambda --endpoint-url=http://localhost:4574 --profile localstack update-function-code --function-name=f1 --zip-file fileb://lambda.zip

exec-sample:
	aws lambda --endpoint-url=http://localhost:4574 invoke --profile localstack --function-name f1 --payload '{"key1":"value1", "key2":"value2", "key3":"value3"}' result.log

exec-s3-put-sample:
	aws lambda --endpoint-url=http://localhost:4574 invoke --profile localstack --function-name f1 --payload file://s3_put_payload.json result.log