# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
locals {
  lambda_managed_policies = [data.aws_iam_policy.AWSLambdaBasicExecutionRole.arn, data.aws_iam_policy.AWSLambdaVPCAccessExecutionRole.arn]
  aft_vpc_id = var.create_vpc ? aws_vpc.aft_vpc[0].id : var.existing_vpc_id
  aft_vpc_private_subnets = var.create_vpc ? tolist([aws_subnet.aft_vpc_private_subnet_01[0].id, aws_subnet.aft_vpc_private_subnet_02[0].id]) : var.existing_vpc_subnets
  aft_vpc_default_sg = var.create_vpc ? tolist([aws_security_group.aft_vpc_default_sg[0].id]) : var.existing_vpc_sg
}

