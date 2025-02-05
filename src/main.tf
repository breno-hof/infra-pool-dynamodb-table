module "dynamo_db" {
	source			= "../../module-dynamo-db/src"

	name			= "pool-registry-table"
	hash_key		= "pool-id"
	hash_key_type	= "S"
	is_billing_mode_pay_per_request = true
}