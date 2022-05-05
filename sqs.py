import boto3
client = boto3.resource('sqs')
queue = client.get_queue_by_name(QueueName='supervoices_sqs')
response = queue.send_message(MessageBody='Audio_test1.ogg')
