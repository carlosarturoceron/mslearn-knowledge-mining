@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id="bcc9f87e-b3fd-4445-8722-74235d295639"
set azure_storage_account="azaiengineerstorage"
set azure_storage_key="7Z28OibFjPP7GKNBggk8pmTfcU3YuUonSpbovsMr+ko1KZ3otyX0d8eOpDRDpfsH68DPaQyjbecH+AStqm9baw=="


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
