@echo off
set domain=%1

call aws s3 mb s3://%domain%
call aws s3 mb s3://www.%domain%

call aws s3api put-bucket-policy --bucket www.%domain% --policy "{\"Statement\": [{\"Effect\": \"Allow\", \"Principal\": {\"AWS\": \"*\"}, \"Action\": \"s3:GetObject\", \"Resource\": \"arn:aws:s3:::www.%domain%/*\"}]}"
call aws s3api put-bucket-website --bucket www.%domain% --website-configuration "{\"IndexDocument\": {\"Suffix\": \"index.html\"}}"
call aws s3api put-bucket-website --bucket %domain% --website-configuration "{\"RedirectAllRequestsTo\": {\"HostName\": \"www.%domain%\"}}"
