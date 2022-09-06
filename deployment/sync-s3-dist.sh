#!/bin/bash

DIST_OUTPUT_BUCKET="${1}"
TEMPLATE_OUTPUT_BUCKET="${2}"
SOLUTION_NAME="${3}"
VERSION="${4}"
PROFILE="${5:-default}"

aws s3 sync "./deployment/global-s3-assets/" "s3://${DIST_OUTPUT_BUCKET}-$(aws configure get region --profile "${PROFILE}")/${SOLUTION_NAME}/${VERSION}/" --profile "${PROFILE}"
aws s3 sync "./deployment/global-s3-assets/" "s3://${TEMPLATE_OUTPUT_BUCKET}/${SOLUTION_NAME}/${VERSION}/" --profile "${PROFILE}"
