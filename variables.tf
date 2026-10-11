variable "network_services_multicast_domain_activations" {
  description = <<EOT
Map of network_services_multicast_domain_activations, attributes below
Required:
    - location
    - multicast_domain
    - multicast_domain_activation_id
Optional:
    - deletion_policy
    - description
    - disable_placement_policy
    - labels
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - traffic_spec (block):
        - aggr_egress_pps (optional)
        - aggr_ingress_pps (optional)
        - avg_packet_size (optional)
        - max_per_group_ingress_pps (optional)
        - max_per_group_subscribers (optional)
EOT

  type = map(object({
    location                       = string
    multicast_domain               = string
    multicast_domain_activation_id = string
    deletion_policy                = optional(string)
    description                    = optional(string)
    disable_placement_policy       = optional(bool)
    labels                         = optional(map(string))
    project                        = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    traffic_spec = optional(object({
      aggr_egress_pps           = optional(string)
      aggr_ingress_pps          = optional(string)
      avg_packet_size           = optional(number)
      max_per_group_ingress_pps = optional(string)
      max_per_group_subscribers = optional(string)
    }))
  }))
}

