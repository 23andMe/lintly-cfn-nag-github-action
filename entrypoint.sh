#!/usr/bin/env bash

args="."
if [[ $# -ne 0 ]]; then
    args="$@"
fi
echo "Hello echoing INPUT_EXCLUDE_RULES"
echo ${INPUT_EXCLUDERULES}

ls -la /

#cfn_nag_scan --input-path ${INPUT_TEMPLATEPATH} --blacklist-path=${INPUT_EXCLUDERULES} --output-format=json | lintly --api-key $INPUT_TOKEN \
#        --fail-on $INPUT_FAILIF \
#       --log --no-post-status --format=cfn-nag


cfn_nag_scan --input-path ${INPUT_TEMPLATEPATH} --blacklist-path=${INPUT_EXCLUDERULES} --output-format=json | lintly --api-key $INPUT_TOKEN \
        --fail-on $INPUT_FAILIF \
       --log --no-post-status --format=cfn-lint
