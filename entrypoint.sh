#!/usr/bin/env bash

args="."
if [[ $# -ne 0 ]]; then
    args="$@"
fi
echo "Hello echoing INPUT_EXCLUDE_RULES"
echo ${INPUT_EXCLUDERULES}

echo "Hello printing INPUT_FAILIF
echo ${INPUT_FAILIF}

echo "printing INPUT_TOKEN"
echo ${INPUT_TOKEN}

ls -la /

cfn_nag_scan --input-path ${INPUT_TEMPLATEPATH} --blacklist-path=${INPUT_EXCLUDERULES} --output-format=json | lintly --api-key $INPUT_TOKEN \
        --fail-on $INPUT_FAILIF \
       --log --no-post-status --format=cfn-nag
