# 테라폼 초기화 파일
# 테라폼 버전 1버전이상 2버전 미만으로 구성되어있다.
terraform {
  required_version = ">= 1.0.0, <2.0.0"

  # aws 프로바이더 설정 ~>4.0은 무엇인지 학습필요
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# 리전 구성
provider "aws" {
  region = "ap-northeast-2" #Asia Pacific (seoul) region
}