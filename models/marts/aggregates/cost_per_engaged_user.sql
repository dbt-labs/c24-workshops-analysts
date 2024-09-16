with engaged_users as (
    select * from {{ ref('int_engaged_users') }}
),
ad_spend_per_adv as (
    select * from {{ ref('sales','ad_spend_per_adv') }}
),

cost_per_engaged_user as (
    select
        e.user_id,
        e.total_engagement,
        a.total_ad_spend
    from engaged_users e
    join ad_spend_per_adv a
    on e.user_id = a.advertiser_id
)

select 
    user_id,
    total_engagement,
    total_ad_spend,
    total_ad_spend / nullif(total_engagement, 0) as cost_per_engaged_user
from cost_per_engaged_user