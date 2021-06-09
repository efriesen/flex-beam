terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project = "twilio-beam-demo"
  region  = "us-central1"
  zone    = "us-central1-c"
}

var "gcs_location" {
  type = string
  gcs_location = "twilio-beam-demo"
}

var "region" {
  type = string
  region = "us-central1"
}

resource "google_dataflow_job" "wordcount" {
  name              = "wordcount"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count:${commit}"
  temp_gcs_location = "gs://${var.gcs_location}/temp"
  parameters = {
    input = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output = "gs://${var.gcs_location}/results/output"
  }
}

resource "google_dataflow_flex_template" "word_count" {
}
