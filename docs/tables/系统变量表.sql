create table cpdb_ds.t_sys_property_param
(
  id  number not null,
  key_code       VARCHAR2(200) not null,
  key_value      VARCHAR2(4000) not null,
  key_desc       VARCHAR2(200),
  ownerid        VARCHAR2(200),
  child_code     VARCHAR2(200),
  child_name     VARCHAR2(500),
  status         VARCHAR2(10),
  update_time    DATE default sysdate not null,
  create_time    DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_property_param
  is 'ϵͳ������';
-- Add comments to the columns 
comment on column cpdb_ds.t_sys_property_param.key_code
  is '����key';
comment on column cpdb_ds.t_sys_property_param.key_value
  is '����ֵ';
 comment on column cpdb_ds.t_sys_property_param.key_desc
  is '����˵��';
comment on column cpdb_ds.t_sys_property_param.ownerid
  is '����ģ��id';
comment on column cpdb_ds.t_sys_property_param.child_code
  is '��ģ��key';
comment on column cpdb_ds.t_sys_property_param.child_name
  is '��ģ��name';
comment on column cpdb_ds.t_sys_property_param.status
  is '״̬:1�ݸ�,2��ʷ,3��������';
comment on column cpdb_ds.t_sys_property_param.create_time
  is '����ʱ��';
create index cpdb_ds.idx_t_sys_property_param01 on cpdb_ds.t_sys_property_param (ownerid);
create index cpdb_ds.idx_t_sys_property_param02 on cpdb_ds.t_sys_property_param (key_code,child_code);

create table cpdb_ds.t_sys_property_model
(
  id  number not null,
  model_id       VARCHAR2(200),
  ownerid        VARCHAR2(200),
  status         VARCHAR2(10),
  update_time    DATE default sysdate not null,
  create_time    DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_property_model
  is 'ϵͳģ��-������';
-- Add comments to the columns 
comment on column cpdb_ds.t_sys_property_model.model_id
  is 'ģ��id';
comment on column cpdb_ds.t_sys_property_model.ownerid
  is 'ģ��id';
comment on column cpdb_ds.t_sys_property_model.status
  is '״̬:1�ݸ�,2��ʷ,3��������';
comment on column cpdb_ds.t_sys_property_model.create_time
  is '����ʱ��';
create index cpdb_ds.idx_t_sys_property_model01 on cpdb_ds.t_sys_property_model (ownerid);
create index cpdb_ds.idx_t_sys_property_model02 on cpdb_ds.t_sys_property_model (model_id);