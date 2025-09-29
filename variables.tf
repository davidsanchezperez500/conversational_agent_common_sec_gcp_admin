variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
  default     = "conversational-agent-commonsec"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-east1"
}

variable "owner_email" {
  type        = string
  description = "Email address of the project owner"
  default     = "project.new.hope.data@gmail.com"
}

variable "project_number" {
  type        = string
  description = "The project number"
  default     = "579307523881"
}
variable "enable_apis" {
  type        = set(string)
  description = "APIs to enable in the project"
  default = [
    "secretmanager.googleapis.com",
    "storage.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudidentity.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "artifactregistry.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}

variable "api_key_front_value" {
  type        = string
  description = "The API key value for the front application"
}
