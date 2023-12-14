resource "aws_apigatewayv2_api" "api_gateway" {
  name          = "Jet-Api"
  protocol_type = "HTTP"
}


resource "aws_apigatewayv2_stage" "default" {
  api_id = var.id_api_gateway
  name   = "$default"
  auto_deploy = true
}
resource "aws_apigatewayv2_integration" "integration" {
  api_id           = var.id_api_gateway
  description      = "proxy for EC2"
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://${aws_instance.jet_terraform.public_ip}:8000/{proxy}"

  integration_method = "ANY"
  connection_type    = "INTERNET"
}

resource "aws_apigatewayv2_route" "api_gateway_rout" {
  api_id    = var.id_api_gateway
  route_key = "ANY /{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.integration.id}"
}