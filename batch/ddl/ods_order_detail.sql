drop table if exists ods_order_detail;
create table ods_order_detail (
    id bigint comment '编号',
    order_id bigint comment '订单id',
    sku_id bigint comment 'sku_id',
    sku_name string comment 'sku名称（冗余)',
    img_url string comment '图片链接（冗余)',
    order_price decimal(10, 2) comment '购买价格(下单时sku价格）',
    sku_num bigint comment '购买个数',
    create_time string comment '创建时间',
    split_total_amount decimal(16, 2),
    split_activity_amount decimal(16, 2),
    split_coupon_amount decimal(16, 2),
    operate_time string comment '修改时间'
)comment = '订单明细表'
partition by (dt string comment '分区')
row formate delimited fields terminated by '\001'
lines terminated by '\n'
stored as parquet;