provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"
  name    = "rusachello-otus-hw9"

  # В модуле косяк. Суть в том, что локейшен действительно опциональное поле, если его нет, оно берется из провайдера. Но внутри модуля определено дефолтное значение в виде пустой строки. И соответственно у него приоритет выше, чем у дефолтного локейшена провайдера. Модуль пытается создать бакет с ним и закономерно валится.
  location = var.location
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
