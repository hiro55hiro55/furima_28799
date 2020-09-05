FactoryBot.define do
  factory :item do
     item_image                    {"OA245ABD-3A72-4D2B-88F2-1B233F107E25.jpeg"}
     item_name                     {"桃"}
     item_info                     {"完熟の季節です"}
     item_category_id              {1}
     item_sales_status_id          {2}
     item_shipping_fee_status_id   {3}
     item_prefecture_id            {3}
     item_scheduled_delivery_id    {2}
     item_price                    { 1000 }
     association :user
    
  end
end


