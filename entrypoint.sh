#!/usr/bin/env bash

args="."
if [[ $# -ne 0 ]]; then
    args="$@"
fi

cfn_nag_scan \
    ${args} \
    --input-path=${INPUT_TEMPLATEPATH} \
    --blacklist-path=${INPUT_EXCLUDE_RULES} \
    --output-format=json \
    | lintly --api-key $INPUT_TOKEN \
        --fail-on $INPUT_FAILIF \
        --log --no-post-status --format=cfn-nag
