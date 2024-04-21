resource "aws_api_gateway_rest_api" "api-iac" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "api_iac"
      version = "1.0"
    }
    paths = {
      "/lambda" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "AWS_PROXY"
            uri                  = var.uri
          }
        }
      }
      "/path1" = {
        get = {

          "parameters": [
            {
              "name": "name",
              "in": "query",
              "description": "",
              "required": true,
              "schema": {
                "type": "string"
              }
            }
          ]

          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://animechan.xyz/api/random/character"
          }
        }
      }
    }
  })

  name = "api_iac"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api-iac.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api-iac.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api-iac.id
  stage_name    = "dev"
}