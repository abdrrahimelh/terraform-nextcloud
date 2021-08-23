terraform {
  backend "remote" {
    organization = "abdrrahimelh"

    workspaces {
      name = "nextcloud"
    }
  }
}