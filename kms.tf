# Create a KMS Key Ring and Crypto Key for Artifact Registry CMEK dev
resource "google_kms_key_ring" "keyring_artifact_registry_repository" {
  name     = "key-ring-artifact-repo-dev-3"
  location = var.region

  depends_on = [
    google_project_service.project
  ]
}

resource "google_kms_crypto_key" "key_artifact_registry_repository" {
  name            = "key-artifact-repo-dev-3"
  key_ring        = google_kms_key_ring.keyring_artifact_registry_repository.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  } 
}

resource "google_kms_crypto_key_iam_binding" "crypto_key_artifact_registry_repository" {
  crypto_key_id = google_kms_crypto_key.key_artifact_registry_repository.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "user:${var.owner_email}",
    "serviceAccount:service-${var.project_number}@gcp-sa-artifactregistry.iam.gserviceaccount.com",
  ]
}

# Create a KMS Key Ring and Crypto Key for Artifact Registry CMEK itg
resource "google_kms_key_ring" "keyring_artifact_registry_repository_itg" {
  name     = "key-ring-artifact-repo-itg"
  location = var.region

  depends_on = [
    google_project_service.project
  ]
}

resource "google_kms_crypto_key" "key_artifact_registry_repository_itg" {
  name            = "key-artifact-repo-itg"
  key_ring        = google_kms_key_ring.keyring_artifact_registry_repository_itg.id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  } 
}


resource "google_kms_crypto_key_iam_binding" "crypto_key_artifact_registry_repository_itg" {
  crypto_key_id = google_kms_crypto_key.key_artifact_registry_repository_itg.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "user:${var.owner_email}",
    "serviceAccount:service-${var.project_number}@gcp-sa-artifactregistry.iam.gserviceaccount.com",
  ]
}


