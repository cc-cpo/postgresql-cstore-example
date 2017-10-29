CREATE FOREIGN TABLE trips (
    vendor_id               VARCHAR(3),
    pickup_datetime         TIMESTAMP NOT NULL,
    dropoff_datetime        TIMESTAMP NOT NULL,
   -- store_and_fwd_flag      VARCHAR(1),
   -- rate_code_id            SMALLINT NOT NULL,
    --pickup_longitude        DECIMAL(18,14),
    --pickup_latitude         DECIMAL(18,14),
   -- dropoff_longitude       DECIMAL(18,14),
    --dropoff_latitude        DECIMAL(18,14),
    passenger_count         SMALLINT NOT NULL DEFAULT '0',
    trip_distance           DECIMAL(6,3) DEFAULT '0.0',
    ratecode SMALLINT NOT NULL,
    store_and_fwd_flag boolean not null,
    pulocation_id smallint not null,
    dolocationid smallint not null,
    payment_type smallint not null,
    fare_amount decimal(10,2),
    extra decimal (6,2),
    mta_tax decimal (6,2),
    tip_amount decimal (6,2),
    tolls_amount decimal (6,2),
    improvement_surcharge decimal (6,2),
    total_amount decimal (6,2)
)
SERVER cstore_server
OPTIONS(compression 'pglz', block_row_count '40000', stripe_row_count '600000');
