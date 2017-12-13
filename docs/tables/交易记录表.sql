--�û��ۿ�Ѽ�¼��־��
create table cpdb_ds.t_sys_payment_log
(
  id  number not null,
  trade_id     VARCHAR2(50),
  acct_id       VARCHAR2(50),
  prod          VARCHAR2(100),
  tags          VARCHAR2(200),
  costs         number,
  test_num_cost      number,
  status        VARCHAR2(10),
  create_time       DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_payment_log
  is '�û��ۿ�Ѽ�¼��־��';
-- Add comments to the columns 
comment on column cpdb_ds.t_sys_payment_log.acct_id
  is '�˻�ID';
comment on column cpdb_ds.t_sys_payment_log.trade_id
  is '���׺�';
comment on column cpdb_ds.t_sys_payment_log.prod
  is '�ۿ��Ʒ';
comment on column cpdb_ds.t_sys_payment_log.tags
  is '�ۿ��ǩ';
comment on column cpdb_ds.t_sys_payment_log.costs
  is '���ѽ����ֵ���';
comment on column cpdb_ds.t_sys_payment_log.test_num_cost
  is '�۳��������������Ӳ�������';
comment on column cpdb_ds.t_sys_payment_log.status
  is '״̬:1��ֵ,2�ۿ�,3�۳���������';
comment on column cpdb_ds.t_sys_payment_log.create_time
  is '����ʱ��';
create index cpdb_ds.idx_t_sys_payment_log01 on cpdb_ds.t_sys_payment_log (trade_id);
create index cpdb_ds.idx_t_sys_payment_log02 on cpdb_ds.t_sys_payment_log (acct_id,prod,tags);

-----------------------------------------��Ʒ-log��----------------------------------------
-- Create table
create table cpdb_ds.T_SYS_REQ_HEADER
(
  id           NUMBER NOT NULL,
  requst_sn    VARCHAR2(32),
  trade_id     VARCHAR2(32),
  version      VARCHAR2(32),
  acct_id      VARCHAR2(200),
  sign         VARCHAR2(200),
  mac_address  VARCHAR2(200),
  ip_address   VARCHAR2(32),
  operid       VARCHAR2(32),
  req_time     DATE default SYSDATE,
  prod_id      VARCHAR2(32)
);
-- Add comments to the columns 
comment on column cpdb_ds.T_SYS_REQ_HEADER.requst_sn
  is '�����׺�';
comment on column cpdb_ds.T_SYS_REQ_HEADER.version
  is '�汾��';
comment on column cpdb_ds.T_SYS_REQ_HEADER.acct_id
  is '�˺�';
comment on column cpdb_ds.T_SYS_REQ_HEADER.sign
  is '����ǩ��';
comment on column cpdb_ds.T_SYS_REQ_HEADER.mac_address
  is 'MAC��ַ';
comment on column cpdb_ds.T_SYS_REQ_HEADER.ip_address
  is 'IP��ַ';
comment on column cpdb_ds.T_SYS_REQ_HEADER.operid
  is '�����û�';
comment on column cpdb_ds.T_SYS_REQ_HEADER.req_time
  is '����ʱ��';
comment on column cpdb_ds.T_SYS_REQ_HEADER.prod_id
  is '��ƷID';

-- Create/Recreate indexes 
create index cpdb_ds.IDX_T_SYS_REQ_HEADER1 on cpdb_ds.T_SYS_REQ_HEADER (REQUST_SN);
create index cpdb_ds.IDX_T_SYS_REQ_HEADER2 on cpdb_ds.T_SYS_REQ_HEADER (trade_id);
-- Create/Recreate primary, unique and foreign key constraints 
alter table CPDB_DS.T_SYS_REQ_HEADER add primary key (ID) using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_sys_req_header
Start with 1
Increment by 1
Cache 50;

-- Create table
create table cpdb_ds.T_SYS_REQ_PARAM
(
  id       NUMBER NOT NULL,
  trade_id VARCHAR2(50),
  key_code VARCHAR2(200),
  value    VARCHAR2(4000),
  update_time DATE default (sysdate)
);
-- Add comments to the columns 
comment on column cpdb_ds.T_SYS_REQ_PARAM.trade_id
  is '�������к�';
comment on column cpdb_ds.T_SYS_REQ_PARAM.key_code
  is '�����ֵ';
comment on column cpdb_ds.T_SYS_REQ_PARAM.value
  is '����ֵ';
-- Create/Recreate indexes 
create index cpdb_ds.IDX_T_SYS_REQ_PARAM1 on cpdb_ds.T_SYS_REQ_PARAM (TRADE_ID);
create index cpdb_ds.IDX_T_SYS_REQ_PARAM2 on cpdb_ds.T_SYS_REQ_PARAM (TRADE_ID, KEY_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table cpdb_ds.T_SYS_REQ_PARAM  add primary key (ID)  using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_sys_req_param
Start with 1
Increment by 1
Cache 50;


-- Create table
create table cpdb_ds.T_SYS_RSP_HEADER
(
  id  number not null,
  response_sn VARCHAR2(32),
  trade_id    VARCHAR2(32),
  version     VARCHAR2(32),
  ret_date    DATE,
  ret_code    VARCHAR2(200),
  ret_msg     VARCHAR2(200),
  time_cost   NUMBER,
  tag         VARCHAR2(500),
  iface_tag   VARCHAR2(500),
  ds_tag      VARCHAR2(500)
);
-- Add comments to the columns 
comment on column cpdb_ds.T_SYS_RSP_HEADER.response_sn
  is '��Ӧ���к�';
comment on column cpdb_ds.T_SYS_RSP_HEADER.trade_id
  is '�������к�';
comment on column cpdb_ds.T_SYS_RSP_HEADER.version
  is '�汾��';
comment on column cpdb_ds.T_SYS_RSP_HEADER.ret_date
  is '���׷���ʱ��';
comment on column cpdb_ds.T_SYS_RSP_HEADER.ret_code
  is '���׷��ش���';
comment on column cpdb_ds.T_SYS_RSP_HEADER.ret_msg
  is '���׷�����Ϣ';
comment on column cpdb_ds.T_SYS_RSP_HEADER.time_cost
  is '�ܼƺ�ʱ(ms)';
comment on column cpdb_ds.T_SYS_RSP_HEADER.tag
  is '��Ʒ�Ʒѱ�ǩ';
comment on column cpdb_ds.T_SYS_RSP_HEADER.iface_tag
  is '�ӿڱ�ǩ';
comment on column cpdb_ds.T_SYS_RSP_HEADER.ds_tag
  is '����Դ��ǩ';
-- Create/Recreate indexes 
create index cpdb_ds.IDX_T_SYS_RSP_HEADER1 on cpdb_ds.T_SYS_RSP_HEADER (TRADE_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table cpdb_ds.T_SYS_RSP_HEADER add primary key (ID) using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_sys_rsp_header
Start with 1
Increment by 1
Cache 50;

-- Create table
create table cpdb_ds.T_SYS_RSP_PARAM
(
  id  number not null,
  trade_id VARCHAR2(50),
  key_code VARCHAR2(200),
  value    VARCHAR2(4000)
);
-- Add comments to the columns 
comment on column cpdb_ds.T_SYS_RSP_PARAM.trade_id
  is '�������к�';
comment on column cpdb_ds.T_SYS_RSP_PARAM.key_code
  is '�����ֵ';
comment on column cpdb_ds.T_SYS_RSP_PARAM.value
  is '���ֵ';
-- Create/Recreate indexes 
create index cpdb_ds.IDX_T_SYS_RSP_PARAM1 on cpdb_ds.T_SYS_RSP_PARAM (TRADE_ID);
create index cpdb_ds.IDX_T_SYS_RSP_PARAM2 on cpdb_ds.T_SYS_RSP_PARAM (TRADE_ID, KEY_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table cpdb_ds.T_SYS_RSP_PARAM  add primary key (ID)  using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_sys_rsp_param
Start with 1
Increment by 1
Cache 50;

-----------------------------------------����Դds-log��----------------------------------------
-- Create table
create table CPDB_DS.T_DS_DATASOURCE_LOG
(
  id          number not null,
  trade_id    VARCHAR2(32) not null,
  ds_id       VARCHAR2(32),
  state_code  VARCHAR2(32),
  state_msg   VARCHAR2(4000),
  req_url     VARCHAR2(300),
  incache     VARCHAR2(32),
  biz_code1   VARCHAR2(200),
  biz_code2   VARCHAR2(200),
  biz_code3   VARCHAR2(200),
  field_id    VARCHAR2(32),
  acct_id     VARCHAR2(50),
  prod_id     VARCHAR2(100),
  req_time    DATE,
  rsp_time    DATE,
  total_cost  NUMBER,
  create_date DATE default sysdate not null,
  update_date DATE default sysdate not null,
  tag         VARCHAR2(500)
);
-- Add comments to the table 
comment on table CPDB_DS.T_DS_DATASOURCE_LOG
  is '�����ݹ�Ӧ�������׽����';
-- Add comments to the columns 
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.id
  is '����';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.trade_id
  is '������ˮ';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.ds_id
  is '��Ӧ��id';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.state_code
  is '����״̬��00�ɹ�01ʧ��02��ʱ';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.state_msg
  is 'ʧ��ԭ��';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.req_url
  is '����url';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.incache
  is '�Ƿ����û������ݣ���1��0';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.biz_code1
  is '������1';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.biz_code2
  is '������1';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.biz_code3
  is '������1';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.field_id
  is '������Ϣ�ļ�id';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.req_time
  is '����ʱ��';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.rsp_time
  is '����ʱ��';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.total_cost
  is '���׺�ʱ';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.create_date
  is '����ʱ��';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.update_date
  is '����ʱ��';
comment on column CPDB_DS.T_DS_DATASOURCE_LOG.tag
  is '����Դ�Ʒѱ�ǩ';
-- Create/Recreate indexes 
create index CPDB_DS.IDX_T_DS_DATASOURCE_LOG on CPDB_DS.T_DS_DATASOURCE_LOG (TRADE_ID);
create index CPDB_DS.IDX_T_DS_DATASRCE_LOG1 on CPDB_DS.T_DS_DATASOURCE_LOG (BIZ_CODE1);
create index CPDB_DS.IDX_T_DS_DATASRCE_LOG2 on CPDB_DS.T_DS_DATASOURCE_LOG (DS_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table CPDB_DS.T_DS_DATASOURCE_LOG  add constraint PK_DATASOURCE_LOG_ID primary key (ID)  using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_DS_DATASOURCE_LOG
Start with 1
Increment by 1
Cache 50;

create table CPDB_DS.T_DS_DATASOURCE_REQ
(
  id           NUMBER NOT NULL,
  trade_id    VARCHAR2(32) not null,
  acct_id    VARCHAR2(50),
  req_name    VARCHAR2(200),
  req_value   VARCHAR2(4000),
  create_date DATE default sysdate not null,
  update_date DATE default sysdate not null
);
-- Add comments to the table 
comment on table CPDB_DS.T_DS_DATASOURCE_REQ
  is '�����ݹ�Ӧ����������α�';
-- Add comments to the columns 
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.id
  is '����';
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.trade_id
  is '������ˮ';
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.req_name
  is '�������';
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.req_value
  is '�������ֵ';
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.create_date
  is '����ʱ��';
comment on column CPDB_DS.T_DS_DATASOURCE_REQ.update_date
  is '����ʱ��';
-- Create/Recreate indexes 
create index CPDB_DS.IDX_T_DS_DATASOURCE_REQ on CPDB_DS.T_DS_DATASOURCE_REQ (TRADE_ID);
create index CPDB_DS.IDX_T_DS_DATASRCE_REQ1 on CPDB_DS.T_DS_DATASOURCE_REQ (REQ_NAME);
create index CPDB_DS.IDX_T_DS_DATASRCE_REQ2 on CPDB_DS.T_DS_DATASOURCE_REQ (REQ_VALUE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table CPDB_DS.T_DS_DATASOURCE_REQ  add constraint PK_DATASOURCE_REQ_ID primary key (ID)  using index ;
-- Create Seq  
Create sequence cpdb_ds.seq_ds_datasource_req
Start with 1
Increment by 1
Cache 50;