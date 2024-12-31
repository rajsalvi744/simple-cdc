#!/bin/bash
set -e
clickhouse client -n <<-EOSQL
           CREATE DATABASE transactions;
           CREATE TABLE IF NOT EXISTS transactions.transactions (
            transaction_id UUID,
            user_id String,
            timestamp Int64,
            amount String,
            currency String,
            city String,
            country String,
            merchant_name String,
            payment_method String,
            ip_address String,
            voucher_code String,
            affiliateid UUID,
            version UInt64,
            deleted UInt8
        ) ENGINE = ReplacingMergeTree
          ORDER BY transaction_id
          PRIMARY KEY(transaction_id)
EOSQL