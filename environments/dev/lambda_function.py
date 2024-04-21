def lambda_handler(event, context):
  message = 'hello'
  return {
      'statusCode': 200,  # HTTP status code
      'body': message,  # The message itself
      'isBase64Encoded': False  # Usually False for text data
  }