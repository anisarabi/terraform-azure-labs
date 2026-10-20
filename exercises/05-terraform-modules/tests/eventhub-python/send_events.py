
import json
import os
from datetime import datetime, timezone

from azure.identity import AzureCliCredential
from azure.eventhub import EventHubProducerClient, EventData


NAMESPACE = os.environ["EVENTHUB_NAMESPACE"]
EVENTHUB_NAME = os.environ["EVENTHUB_NAME"]

credential = AzureCliCredential()

producer = EventHubProducerClient(
    fully_qualified_namespace=f"{NAMESPACE}.servicebus.windows.net",
    eventhub_name=EVENTHUB_NAME,
    credential=credential,
)

with producer:
    batch = producer.create_batch()

    for i in range(1, 11):
        event = {
            "event_id": i,
            "application": "terraform-lab",
            "level": "INFO",
            "message": f"Test event number {i}",
            "timestamp": datetime.now(timezone.utc).isoformat(),
        }

        batch.add(EventData(json.dumps(event)))

    producer.send_batch(batch)

print("Successfully sent 10 events to Azure Event Hubs")
