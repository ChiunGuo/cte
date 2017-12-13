/*======================================
�����ͣ����ױ�
������Ԥ����1000/T
����������Ԥ����0.1W
�����������ڣ�����
=======================================*/
-- create table
create table cpdb_ds.t_ds_jixin_result
(
  id              NUMBER NOT NULL,
  trade_id        varchar2(32) not null,
  cardno          varchar2(200) ,
  dsorderid       varchar2(100),
  merchno         varchar2(200),
  returncode      varchar2(100),
  errtext         varchar2(300),
  transcode        varchar2(100),
  ordersn        varchar2(100),
  orderid        varchar2(100),
  sign           varchar2(200),
  update_time     date default sysdate not null,
  create_time     date default sysdate not null
);
-- add comments to the table 
comment on table cpdb_ds.t_ds_jixin_result
  is '�������п�3Ҫ����ر�';
-- add comments to the columns 
comment on column cpdb_ds.t_ds_jixin_result.trade_id
  is '���׺�';
comment on column cpdb_ds.t_ds_jixin_result.cardno
  is '֤����';
comment on column cpdb_ds.t_ds_jixin_result.dsorderid
  is '�̻�������';
comment on column cpdb_ds.t_ds_jixin_result.merchno
  is '�̻���';
comment on column cpdb_ds.t_ds_jixin_result.returncode
  is '������';
comment on column cpdb_ds.t_ds_jixin_result.errtext
  is '������Ϣ';
comment on column cpdb_ds.t_ds_jixin_result.ordersn
  is '�̻�������ˮ��';
comment on column cpdb_ds.t_ds_jixin_result.orderid
  is 'ƽ̨������ˮ��';
comment on column cpdb_ds.t_ds_jixin_result.sign
  is '����У��ֵ';
comment on column cpdb_ds.t_ds_jixin_result.update_time
  is '����ʱ��';
comment on column cpdb_ds.t_ds_jixin_result.create_time
  is '����ʱ��';
-- create/recreate indexes 
alter table cpdb_ds.t_ds_jixin_result add constraint pk_ds_jixin_result_id primary key (id)  using index;
create  index idx_ds_jixin_result01 on cpdb_ds.t_ds_jixin_result (cardno);
create index idx_ds_jixin_result02 on cpdb_ds.t_ds_jixin_result (trade_id);

-- Create Seq  
Create sequence cpdb_ds.seq_t_ds_jixin_result
Start with 1
Increment by 1
Cache 20; 