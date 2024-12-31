#!/bin/bash
set -e
clickhouse client -n <<-EOSQL
          CREATE TABLE IF NOT EXISTS transactions.transactions_scd(
          before_transaction_id Nullable(UUID),
          before_user_id Nullable(String),
          before_timestamp Nullable(Int64),
          before_amount Nullable(String),
          before_currency Nullable(String),
          before_city Nullable(String),
          before_country Nullable(String),
          before_merchant_name Nullable(String),
          before_payment_method Nullable(String),
          before_ip_address Nullable(String),
          before_voucher_code Nullable(String),
          before_affiliateid Nullable(UUID),
          after_transaction_id Nullable(UUID),
          after_user_id Nullable(String),
          after_timestamp Nullable(Int64),
          after_amount Nullable(String),
          after_currency Nullable(String),
          after_city Nullable(String),
          after_country Nullable(String),
          after_merchant_name Nullable(String),
          after_payment_method Nullable(String),
          after_ip_address Nullable(String),
          after_voucher_code Nullable(String),
          after_affiliateid Nullable(UUID),
          op LowCardinality(Nullable(String)),
          ts_ms UInt64,
          source_sequence String,
          source_lsn UInt64
          )
          ENGINE = MergeTree
          ORDER BY tuple()
EOSQL