terraform {
  backend "gcs" {
    bucket  = "rusachello-otus-hw9"
    prefix  = "terraform/state/stage"
  }
}
