# Secret Manager DEV
resource "google_secret_manager_secret" "api_key_front_dev" {
  project   = var.project_id
  secret_id = "api-key-front-dev"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "api_key_front_version_dev" {
  secret      = google_secret_manager_secret.api_key_front_dev.id
  secret_data = var.api_key_front_value
}

resource "google_secret_manager_secret_iam_member" "secret_binding_dev" {
  secret_id = google_secret_manager_secret.api_key_front_dev.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:sa-frontend-agent-dev@conversational-agent-dev.iam.gserviceaccount.com"
}


# Secret Manager ITG
resource "google_secret_manager_secret" "api_key_front_itg" {
  project   = var.project_id
  secret_id = "api-key-front-itg"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "api_key_front_version_itg" {
  secret      = google_secret_manager_secret.api_key_front_itg.id
  secret_data = var.api_key_front_value
}

resource "google_secret_manager_secret_iam_member" "secret_binding_itg" {
  secret_id = google_secret_manager_secret.api_key_front_itg.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:sa-frontend-agent-itg@conversational-agent-itg.iam.gserviceaccount.com"
}
