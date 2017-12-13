create table cpdb_ds.t_sys_acct_prods
(
  id            VARCHAR2(32) not null,
  acct_id       VARCHAR2(32),
  prod_limit    VARCHAR2(100),
  price         number,
  test_num      number,
  status        VARCHAR2(10),
  update_time       DATE default sysdate not null,
  create_time       DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_acct_prods
  is '�˻���Ʒ��Ȩ��';
-- Add comments to the columns 
comment on column cpdb_ds.t_sys_acct_prods.acct_id
  is '�˻�ID';
comment on column cpdb_ds.t_sys_acct_prods.prod_limit
  is '��Ȩ��Ʒ';
comment on column cpdb_ds.t_sys_acct_prods.price
  is '��Ʒ�۸�';
comment on column cpdb_ds.t_sys_acct_prods.test_num
  is '��������';
comment on column cpdb_ds.t_sys_acct_prods.status
  is '״̬:1��Ʒ����,2��Ʒ����,3��Ʒ����';
comment on column cpdb_ds.t_sys_acct_prods.update_time
  is '����ʱ��';
create index cpdb_ds.idx_t_sys_acct_prods01 on cpdb_ds.t_sys_acct_prods (acct_id);


-- Create table
create table cpdb_ds.t_sys_acct_ip_limits
(
  id  NUMBER NOT NULL,
  acct_id       VARCHAR2(32),
  ip_limit   VARCHAR2(100),
  status       VARCHAR2(10),
  update_time       DATE default sysdate not null,
  create_time       DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_acct_ip_limits
  is '�˻�ip��������Ȩ��';
-- Add comments to the columns 
comment on column cpdb_ds.t_sys_acct_ip_limits.acct_id
  is '�˻�ID';
comment on column cpdb_ds.t_sys_acct_ip_limits.ip_limit
  is '��Ȩip';
comment on column cpdb_ds.t_sys_acct_ip_limits.status
  is '״̬:1 ip����,2 ip������';
comment on column cpdb_ds.t_sys_acct_ip_limits.update_time
  is '����ʱ��';
create index cpdb_ds.idx_t_sys_acct_ip01 on cpdb_ds.t_sys_acct_ip_limits (acct_id);

-- Create table
create table T_SYS_ACCOUNT
(
  id            VARCHAR2(32) not null,
  acct_id       VARCHAR2(32),
  org_code      VARCHAR2(32),
  org_name      VARCHAR2(200),
  org_full_name VARCHAR2(400),
  api_key       VARCHAR2(32),
  outer_flag    VARCHAR2(1),
  balance       NUMBER,
  status        VARCHAR2(2),
  enddate       DATE,
  note          VARCHAR2(400),
  mobiles       VARCHAR2(100),
  acct_name     VARCHAR2(400),
  ip_valid      VARCHAR2(1) default '1',
  emails        VARCHAR2(100),
  isfee         VARCHAR2(20) default '��ѿͻ�'
);
-- Add comments to the columns 
comment on column T_SYS_ACCOUNT.acct_id
  is '�˻�ID';
comment on column T_SYS_ACCOUNT.org_name
  is '�ͻ���λ����';
comment on column T_SYS_ACCOUNT.org_full_name
  is '�ͻ���λȫ��';
comment on column T_SYS_ACCOUNT.api_key
  is '�����API KEY';
comment on column T_SYS_ACCOUNT.outer_flag
  is '���ⲿ�ͻ���ʶ';
comment on column T_SYS_ACCOUNT.balance
  is '�������';
comment on column T_SYS_ACCOUNT.status
  is '��ǰ״̬(0:����,-1:����,-2:ע��,-3:����)';
comment on column T_SYS_ACCOUNT.enddate
  is '��ֹʱ��';
comment on column T_SYS_ACCOUNT.note
  is '��ע';
comment on column T_SYS_ACCOUNT.acct_name
  is '�˻�����';
comment on column T_SYS_ACCOUNT.isfee
  is '1���Կͻ�,2��ʽ�ͻ�';
-- Create/Recreate indexes 
create index IDX_T_SYS_CUSTOMER1 on T_SYS_ACCOUNT (ACCT_ID);

create table cpdb_ds.t_sys_account_log
(
  id            varchar2(32) not null,
  acct_id       varchar2(32), 
  cost          number,
  prods          varchar2(100),
  ip_valid      varchar2(100),
  create_time       DATE default sysdate not null
);
comment on table cpdb_ds.t_sys_account_log
  is '�˻���Ȩ��־��';
-- add comments to the columns 
comment on column cpdb_ds.t_sys_account_log.acct_id
  is '�˻�id';
comment on column cpdb_ds.t_sys_account_log.cost
  is '��ֵ���';
comment on column cpdb_ds.t_sys_account_log.prods
  is '��Ȩ��Ʒ';
comment on column cpdb_ds.t_sys_account_log.ip_valid
  is '��Ȩip';
-- create/recreate indexes 
create index idx_t_sys_account_log1 on cpdb_ds.t_sys_account_log (acct_id);
