

with campaigns as (

    select * from {{ ref('stg_campaigns') }}

),final as (

    select
    
    id,
    seq,
    name,
    tier_name,
    owner

    from campaigns

)

select * from final