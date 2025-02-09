module "dynamo_db" {
	source							= "github.com/breno-hof/module-dynamo-db//src?ref=1.0.0"

	name							= local.name
	hash_key						= local.partition_key.name
	hash_key_type					= local.partition_key.type
	# range_key						= local.sort_key.name
	# range_key_type				= local.sort_key.type
	is_billing_mode_pay_per_request = true
	is_ttl_enabled					= true
	is_stream_enabled 				= true
	is_deletion_protection_enabled	= false

	global_secondary_index = [ {
		index_name 					= "heating_type_index"
		attribute_name 				= "heating_type"
		attribute_type 				= local.string_type
		range_key 					= local.partition_key.name
		projection_type				= "ALL"
	}, {
		index_name 					= "material_index"
		attribute_name 				= "material"
		attribute_type 				= local.string_type
		range_key 					= local.partition_key.name
		projection_type				= "KEYS_ONLY"
	} ]

	# local_secondary_index = [ {
	# 	index_name 					= "record_type_local_index"
	# 	range_key 					= local.sort_key.name
	# 	projection_type				= "ALL"
	# } ]

	# replica = [ {
	# 	region_name = "sa-east-1"
	# } ]
}