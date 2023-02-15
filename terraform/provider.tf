# �׶��� �ʱ�ȭ ����
# �׶��� ���� 1�����̻� 2���� �̸����� �����Ǿ��ִ�.
terraform {
  required_version = ">= 1.0.0, <2.0.0"

  # aws ���ι��̴� ���� ~>4.0�� �������� �н��ʿ�
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# ���� ����
provider "aws" {
  region = "ap-northeast-2" #Asia Pacific (seoul) region
}