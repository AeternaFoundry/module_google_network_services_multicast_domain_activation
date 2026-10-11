resource "google_network_services_multicast_domain_activation" "network_services_multicast_domain_activations" {
  for_each = var.network_services_multicast_domain_activations

  location                       = each.value.location
  multicast_domain               = each.value.multicast_domain
  multicast_domain_activation_id = each.value.multicast_domain_activation_id
  deletion_policy                = each.value.deletion_policy
  description                    = each.value.description
  disable_placement_policy       = each.value.disable_placement_policy
  labels                         = each.value.labels
  project                        = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "traffic_spec" {
    for_each = each.value.traffic_spec != null ? [each.value.traffic_spec] : []
    content {
      aggr_egress_pps           = traffic_spec.value.aggr_egress_pps
      aggr_ingress_pps          = traffic_spec.value.aggr_ingress_pps
      avg_packet_size           = traffic_spec.value.avg_packet_size
      max_per_group_ingress_pps = traffic_spec.value.max_per_group_ingress_pps
      max_per_group_subscribers = traffic_spec.value.max_per_group_subscribers
    }
  }
}

