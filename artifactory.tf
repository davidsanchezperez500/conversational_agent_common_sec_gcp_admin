# DEV
resource "google_artifact_registry_repository" "repository_docker_dev" {
  location      = "${var.region}"
  repository_id = "docker-repository-dev"
  description   = "Docker repository-dev"
  format        = "DOCKER"
  kms_key_name  = "projects/${var.project_id}/locations/${var.region}/keyRings/key-ring-artifact-repo-dev-3/cryptoKeys/key-artifact-repo-dev-3"
  vulnerability_scanning_config {
    enablement_config = "INHERITED"
  }
  depends_on = [
    google_kms_crypto_key_iam_binding.crypto_key_artifact_registry_repository
  ]
}

resource "google_artifact_registry_repository_iam_member" "cloud_run_reader_access_dev" {
  project    = var.project_id  
  repository = "docker-repository-dev"
  location   = var.region
  role       = "roles/artifactregistry.reader" 
  member     = "serviceAccount:service-884109815379@serverless-robot-prod.iam.gserviceaccount.com"
}


# ITG
resource "google_artifact_registry_repository" "repository_docker_itg" {
  location      = "${var.region}"
  repository_id = "docker-repository-itg"
  description   = "Docker repository-itg"
  format        = "DOCKER"
  kms_key_name  = "projects/${var.project_id}/locations/${var.region}/keyRings/key-ring-artifact-repo-itg/cryptoKeys/key-artifact-repo-itg"
  vulnerability_scanning_config {
    enablement_config = "INHERITED"
  }
  depends_on = [
    google_kms_crypto_key_iam_binding.crypto_key_artifact_registry_repository_itg
  ]
}

resource "google_artifact_registry_repository_iam_member" "cloud_run_reader_access_itg" {
  project    = var.project_id  
  repository = "docker-repository-itg"
  location   = var.region
  role       = "roles/artifactregistry.reader" 
  member     = "serviceAccount:service-630186343641@serverless-robot-prod.iam.gserviceaccount.com"
}
