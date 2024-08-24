import boto3
from datetime import datetime


def lambda_handler(event, context):
    ses_client= boto3.client('ses', region_name= 'eu-west-1')
    sender_email = "mohammadelsharqawyegy@gmail.com"
    recipient_email = "mohammadelsharqawyegy@gmail.com"
    subject = "Change in state file"
    messege = f"Dear {recipient_email}. \n\n A change in the state file occurred at {datetime.now().isoformat()}."

    response = ses_client.send_email(
        Source = sender_email,
        Destination = {
            'ToAddresses':[
                recipient_email
            ]
        },
        Messege = {
            'Subject':{
                'Data':subject,
                'Charset': 'utf-8'
            },
            'Body':{
                'Text':{
                    'Data': messege,
                    'Charset': 'utf-8'
                }
            }
        }
    )


    print(f"Email sent to {recipient_email}: {response['MessageId']}")