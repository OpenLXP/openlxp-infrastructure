resource "aws_ssm_parameter" "MYSQL_DATABASE" {
  name  = "MYSQL_DATABASE"
  type  = "String"
  value = "xia_dau_mysql"
}

resource "aws_ssm_parameter" "MYSQL_PASSWORD" {
  name  = "MYSQL_PASSWORD"
  type  = "String"
  value = "-uspEcr0ql3l$6brl_ha"
}

resource "aws_ssm_parameter" "MYSQL_ROOT_PASSWORD" {
  name  = "MYSQL_ROOT_PASSWORD"
  type  = "String"
  value = "TA+p&-3UXIv!cr0YU0_H"
}

resource "aws_ssm_parameter" "MYSQL_USER" {
  name  = "MYSQL_USER"
  type  = "String"
  value = "admin"
}

resource "aws_ssm_parameter" "DJANGO_SUPERUSER_USERNAME" {
  name  = "DJANGO_SUPERUSER_USERNAME"
  type  = "String"
  value = "admin"
}

resource "aws_ssm_parameter" "DJANGO_SUPERUSER_PASSWORD" {
  name  = "DJANGO_SUPERUSER_PASSWORD"
  type  = "String"
  value = "kas-f7fracablnaR?@lb"
}

resource "aws_ssm_parameter" "ECC_DEFAULT_REGION" {
  name  = "ECC_DEFAULT_REGION"
  type  = "String"
  value = "us-east-1"
}

resource "aws_ssm_parameter" "REACT_APP_CONFIGURATION_API" {
  name  = "REACT_APP_CONFIGURATION_API"
  type  = "String"
  value = "http://54.160.23.156:8100/api/ui-configuration/"
}

resource "aws_ssm_parameter" "REACT_APP_ES_API" {
  name  = "REACT_APP_ES_API"
  type  = "String"
  value = "http://54.160.23.156:8100/es-api/"
}

resource "aws_ssm_parameter" "REACT_APP_ES_MLT_API" {
  name  = "REACT_APP_ES_MLT_API"
  type  = "String"
  value = "http://54.160.23.156:8100/es-api/more-like-this/"
}

resource "aws_ssm_parameter" "REACT_APP_BACKEND_HOST" {
  name  = "REACT_APP_BACKEND_HOST"
  type  = "String"
  value = "http://54.160.23.156:8100"
}

resource "aws_ssm_parameter" "REACT_APP_SPOTLIGHT_COURSES" {
  name  = "REACT_APP_SPOTLIGHT_COURSES"
  type  = "String"
  value = "http://54.160.23.156:8100/api/spotlight-courses"
}

resource "aws_ssm_parameter" "BUCKET_NAME" {
  name  = "BUCKET_NAME"
  type  = "String"
  value = "eccschema"
}

resource "aws_ssm_parameter" "XIS_API_ENDPOINT" {
  name  = "XIS_API_ENDPOINT"
  type  = "String"
  value = "http://openlxp-xis:8020/api/metadata/"
}
