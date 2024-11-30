WITH
  temp1 AS(
  SELECT
    *,
    SUM(CASE WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 AND objective = "Sales" THEN Costs_USD ELSE 0 END ) OVER (PARTITION BY Campaign) AS Sales_Cost_campaign_L7D,
    SUM(CASE WHEN objective ="Sales" THEN Costs_USD ELSE 0 END) OVER 
    (PARTITION BY campaign) AS Sales_Cost_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 AND objective = "Sales" THEN Costs_USD
      ELSE
      0
    END
      ) OVER (PARTITION BY Objective) AS Sales_Cost_objective_L7D,
    SUM(CASE
        WHEN objective ="Sales" THEN Costs_USD
      ELSE
      0
    END
      ) OVER (PARTITION BY Objective) AS Sales_Cost_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Total_Opps
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) opps_campaign_L7D,
    SUM(Total_Opps) OVER (PARTITION BY campaign) AS opps_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Total_Opps
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS opps_objective_L7D,
    SUM(Total_Opps) OVER (PARTITION BY objective) AS opps_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Checkout_Appointment_Opps
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) Checkout_Appointment_Opps_campaign_L7D,
    SUM(Checkout_Appointment_Opps) OVER (PARTITION BY campaign) AS Checkout_Appointment_Opps_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Checkout_Appointment_Opps
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS Checkout_Appointment_Opps_objective_L7D,
    SUM(Checkout_Appointment_Opps) OVER (PARTITION BY objective) AS Checkout_Appointment_Opps_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Online_Booking_id8
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) booking_campaign_L7D,
    SUM(Online_Booking_id8) OVER (PARTITION BY campaign) AS booking_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Online_Booking_id8
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS booking_objective_L7D,
    SUM(Online_Booking_id8) OVER (PARTITION BY objective) AS booking_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Scheduled_Appointment_id19
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) appointment_campaign_L7D,
    SUM(Scheduled_Appointment_id19) OVER (PARTITION BY campaign) AS appointment_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN Scheduled_Appointment_id19
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS appointment_objective_L7D,
    SUM(Scheduled_Appointment_id19) OVER (PARTITION BY objective) AS appointment_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_leads
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) leads_campaign_L7D,
    SUM(attribution_leads) OVER (PARTITION BY campaign) AS leads_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_leads
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS leads_objective_L7D,
    SUM(attribution_leads) OVER (PARTITION BY objective) AS leads_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_bookers
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) bookers_campaign_L7D,
    SUM(attribution_bookers) OVER (PARTITION BY campaign) AS bookers_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_bookers
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS bookers_objective_L7D,
    SUM(attribution_bookers) OVER (PARTITION BY objective) AS bookers_objective_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_buyers
      ELSE
      0
    END
      ) OVER (PARTITION BY Campaign) buyers_campaign_L7D,
    SUM(attribution_buyers) OVER (PARTITION BY campaign) AS buyers_campaign_L30D,
    SUM(CASE
        WHEN date BETWEEN CURRENT_DATE('Europe/Istanbul') - 7 AND CURRENT_DATE('Europe/Istanbul') - 1 THEN attribution_buyers
      ELSE
      0
    END
      ) OVER (PARTITION BY objective) AS buyers_objective_L7D,
    SUM(attribution_buyers) OVER (PARTITION BY objective) AS buyers_objective_L30D,
  FROM
    `xxx.db.final_table`
  WHERE
    Channel_Group = "Paid"
    AND date BETWEEN CURRENT_DATE('Europe/Istanbul') - 30
    AND CURRENT_DATE('Europe/Istanbul') - 1 ),
  temp2 AS(
  SELECT
    Channel_Group,
    Channel,
    Objective,
    Country,
    Audience,
    Network,
    LANGUAGE,
    Funnel_Stage,
    End_time,
    Buying_type,
    Campaign_Objective,
    Campaign_Optimization_Conversion,
    Campaign_Content,
    Campaign,
    ROUND(Sales_Cost_campaign_L7D,0) AS Sales_Cost_campaign_L7D,
    ROUND(Sales_Cost_campaign_L30D,0)AS Sales_Cost_campaign_L30D,
    ROUND(Sales_Cost_objective_L7D,0)AS Sales_Cost_objective_L7D,
    ROUND(Sales_Cost_objective_L30D,0)AS Sales_Cost_objective_L30D,
    opps_campaign_L7D,
    opps_campaign_L30D,
    opps_objective_L7D,
    opps_objective_L30D,
    Checkout_Appointment_Opps_campaign_L7D,
    Checkout_Appointment_Opps_campaign_L30D,
    Checkout_Appointment_Opps_objective_L7D,
    Checkout_Appointment_Opps_objective_L30D,
    booking_campaign_L7D,
    booking_campaign_L30D,
    booking_objective_L7D,
    booking_objective_L30D,
    appointment_campaign_L7D,
    appointment_campaign_L30D,
    appointment_objective_L7D,
    appointment_objective_L30D,
    leads_campaign_L7D,
    leads_campaign_L30D,
    leads_objective_L7D,
    leads_objective_L30D,
    bookers_campaign_L7D,
    bookers_campaign_L30D,
    bookers_objective_L7D,
    bookers_objective_L30D,
    buyers_campaign_L7D,
    buyers_campaign_L30D,
    buyers_objective_L7D,
    buyers_objective_L30D,
  FROM
    temp1
  GROUP BY
    Channel_Group,
    Channel,
    Objective,
    Country,
    Audience,
    Network,
    LANGUAGE,
    Funnel_Stage,
    End_time,
    Buying_type,
    Campaign_Objective,
    Campaign_Optimization_Conversion,
    Campaign_Content,
    Campaign,
    Sales_Cost_campaign_L7D,
    Sales_Cost_campaign_L30D,
    Sales_Cost_objective_L7D,
    Sales_Cost_objective_L30D,
    opps_campaign_L7D,
    opps_campaign_L30D,
    opps_objective_L7D,
    opps_objective_L30D,
    Checkout_Appointment_Opps_campaign_L7D,
    Checkout_Appointment_Opps_campaign_L30D,
    Checkout_Appointment_Opps_objective_L7D,
    Checkout_Appointment_Opps_objective_L30D,
    booking_campaign_L7D,
    booking_campaign_L30D,
    booking_objective_L7D,
    booking_objective_L30D,
    appointment_campaign_L7D,
    appointment_campaign_L30D,
    appointment_objective_L7D,
    appointment_objective_L30D,
    leads_campaign_L7D,
    leads_campaign_L30D,
    leads_objective_L7D,
    leads_objective_L30D,
    bookers_campaign_L7D,
    bookers_campaign_L30D,
    bookers_objective_L7D,
    bookers_objective_L30D,
    buyers_campaign_L7D,
    buyers_campaign_L30D,
    buyers_objective_L7D,
    buyers_objective_L30D)
SELECT
  *
FROM
  temp2
ORDER BY
  Sales_Cost_campaign_L30D DESC
