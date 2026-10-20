
import json
import os
import threading

from azure.identity import AzureCliCredential
from azure.eventhub import EventHubConsumerClient


NAMESPACE = os.environ["EVENTHUB_NAMESPACE"]
EVENTHUB_NAME = os.environ["EVENTHUB_NAME"]
CONSUMER_GROUP = os.environ["EVENTHUB_CONSUMER_GROUP"]

credential = AzureCliCredential()

consumer = EventHubConsumerClient(
    fully_qualified_namespace=f"{NAMESPACE}.servicebus.windows.net",
    eventhub_name=EVENTHUB_NAME,
    consumer_group=CONSUMER_GROUP,
    credential=credential,
)

received_count = 0
stop_event = threading.Event()


def on_event(partition_context, event):
    global received_count

    if event is None:
        return

    try:
        payload = json.loads(event.body_as_str())
    except (ValueError, UnicodeDecodeError):
        return

    if payload.get("application") != "terraform-lab":
        return

    print(
        f"Partition={partition_context.partition_id} "
        f"Event={payload}"
    )

    received_count += 1

    if received_count >= 10:
        stop_event.set()


with consumer:
    consumer.receive(
        on_event=on_event,
        starting_position="-1",
        starting_position_inclusive=True,
        max_wait_time=5,
        stop_event=stop_event,
    )

print(f"Total matching events received: {received_count}")
