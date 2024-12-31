#!/bin/bash
set -e
clickhouse client -n <<-EOSQL
           CREATE MATERIALIZED VIEW transactions.transactions_mv TO transactions.transactions(
           transaction_id Nullable(UUID),
           user_id Nullable(String),
           timestamp Nullable(Int64),
           amount Nullable(String),
           currency Nullable(String),
           city Nullable(String),
           country Nullable(String),
           merchant_name Nullable(String),
           payment_method Nullable(String),
           ip_address Nullable(String),
           voucher_code Nullable(String),
           affiliateid Nullable(UUID),
           version Nullable(UInt64),
           deleted Nullable(UInt8)
           ) AS
           SELECT
           if(op = 'd',before_transaction_id,after_transaction_id) AS transaction_id,
           if(op = 'd',before_user_id,after_user_id) AS user_id,
           if(op = 'd',before_timestamp,after_timestamp) AS timestamp,
           if(op = 'd',before_amount,after_amount) AS amount,
           if(op = 'd',before_currency,after_currency) as currency,
           if(op = 'd',before_city,after_city) AS city,
           if(op = 'd',before_country,after_country) AS country,
           if(op = 'd',before_merchant_name,after_merchant_name) AS merchant_name,
           if(op = 'd',before_payment_method,after_payment_method) AS payment_method,
           if(op = 'd',before_ip_address,after_ip_address) AS ip_address,
           if(op = 'd',before_voucher_code,after_voucher_code) AS voucher_code,
           if(op = 'd',before_affiliateid,after_affiliateid) AS affiliateid,
           if(op = 'd', source_lsn, source_lsn) AS version,
           if(op = 'd', 1, 0) AS deleted
           FROM transactions.transactions_scd
           WHERE (op = 'c') OR (op = 'r') OR (op = 'u') OR (op = 'd')

EOSQL