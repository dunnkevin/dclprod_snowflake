view: union_test_number {

    derived_table: {
      sql: SELECT 14 AS deployment_rate_timeframe, count(*) FROM "PUBLIC"."PRODUCTS"
            UNION
            SELECT 120 AS deployment_rate_timeframe, count(*) FROM "PUBLIC"."PRODUCTS"
            UNION
            SELECT 150 AS deployment_rate_timeframe, count(*) FROM "PUBLIC"."PRODUCTS";;
    }

    dimension: deployment_rate_timeframe {
      type: number
      sql: ${TABLE}.deployment_rate_timeframe ;;
    }

    measure: blah {
      type: count
    }
  }
