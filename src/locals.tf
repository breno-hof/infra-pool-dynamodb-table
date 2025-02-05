locals {
	string_type = "S"
	
	name				= "pool_registry_table"

	partition_key = {
		name = "pool_id"
		type = local.string_type
	}

	sort_key = {
		name = "record_type"
		type = local.string_type
	}

	tags				= {
		Application		= local.name,
		GitHubRepo		= "pool-registry-service-dynamo-db"
	}
}