#!/bin/bash

domain=$1

aws s3 mb s3://$domain
aws s3 mb s3://www.$domain

aws s3api put-bucket-policy --bucket www.$domain --policy '{"Statement": [{"Effect": "Allow", "Principal": {"AWS": "*"}, "Action": "s3:GetObject", "Resource": "arn:aws:s3:::www.'$domain'/*"}]}'
aws s3api put-bucket-website --bucket www.$domain --website-configuration '{"IndexDocument": {"Suffix": "index.html"}}'
aws s3api put-bucket-website --bucket $domain --website-configuration '{"RedirectAllRequestsTo": {"HostName": "www.'$domain'"}}'
