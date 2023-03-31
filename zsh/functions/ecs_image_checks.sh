#!/bin/bash

declare -A stacks

stacks["\n############ PROD CORE ############\n"]='prod_qapps_qcx'
stacks["\n############ Carlehealth ############\n"]='prod_elevate_chh'
stacks["\n############ Centura ############\n"]='prod_elevate_cen'
stacks["\n############ Honorhealth ############\n"]='prod_elevate_hhs'
stacks["\n############ Midland ############\n"]='prod_elevate_mmh'
stacks["\n############ Renown ############\n"]='prod_elevate_rnw'
stacks["\n############ Tenet ############\n"]='prod_elevate_tnt'
stacks["\n############ UPMC ############\n"]='prod_elevate_upm'
stacks["\n############ Virtuahealth ############\n"]='prod_elevate_vth'

# zsh associative array key reference. For Bash use ${!stacks[@]}
for key in ${(@k)stacks}
do
    echo "$key"

    aws ecs describe-tasks \
    --tasks $(aws ecs list-tasks \
        --cluster prod-1 \
        --service-name "${stacks[$key]}" \
        --query 'taskArns[*]' \
        --output text) \
    --cluster prod-1 \
    --query 'tasks[*].[taskArn, containers[*].[image, imageDigest]]' \
    --output text
done
