import os

ENV TEMPLATE_PATH="gs://twilio-beam-demo/samples/dataflow/python/wordcount.json"
ENV TEMPLATE_IMAGE="gcr.io/twilio-beam-demo/samples/dataflow/wordcount:latest"

os.system("gcloud builds submit --tag "$TEMPLATE_IMAGE" .")
os.system("gcloud dataflow flex-template build $TEMPLATE_PATH --image "$(TEMPLATE_IMAGE)" --sdk-language "PYTHON" --metadata-file "metadata.json"")
