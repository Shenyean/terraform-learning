data "aws_vpc" "selected"{
    default = true
}

data "aws_subnets" "all"{
    filter{
        name = "vpc-id"
        values = [data.aws_vpc.selected]
    }
}

data "random_shuffle" "subnet"{
    input = data.aws_subnets.all.id
    result_count 
}