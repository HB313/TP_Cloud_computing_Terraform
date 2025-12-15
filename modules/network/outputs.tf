output "vpc_id" {
    description = "VPC self link"
    value       = google_compute_network.vpc.id
}

output "subnet_self_link" {
    description = "Public subnet self link"
    value       = google_compute_subnetwork.public.self_link
}
