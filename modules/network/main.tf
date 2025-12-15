resource "google_compute_network" "vpc" {
    name                    = "${var.network_name}-${var.environment}"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
    name                     = "${var.network_name}-${var.environment}-public"
    ip_cidr_range            = var.cidr_block
    region                   = var.region
    network                  = google_compute_network.vpc.id
    private_ip_google_access = true
}

resource "google_compute_firewall" "allow-web" {
    name          = "${var.network_name}-${var.environment}-allow-web"
    network       = google_compute_network.vpc.name
    direction     = "INGRESS"
    priority      = 1000
    source_ranges = ["0.0.0.0/0"]

    allow {
        protocol = "tcp"
        ports    = ["80", "443"]
    }
}
