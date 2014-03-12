@echo off
set domain=%1

call aws s3 mb s3://%domain%
call aws s3 mb s3://www.%domain%
