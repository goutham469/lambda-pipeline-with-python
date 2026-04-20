from app import app
import awsgi

def lambda_handler(event, context):
    from awsgi import response
    return response(app, event, context)
