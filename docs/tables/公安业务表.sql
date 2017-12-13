-- Create table
create table CPDB_DS.T_DS_NCIIC_RESULT
(
  id          VARCHAR2(32) default sys_guid() not null,
  trade_id    VARCHAR2(32) not null,
  cardno      VARCHAR2(1000) not null,
  name        VARCHAR2(200),
  card_check  VARCHAR2(50),
  name_check  VARCHAR2(50),
  error_mesg  VARCHAR2(500),
  status      VARCHAR2(10),
  image_file  VARCHAR2(500),
  update_time DATE default sysdate not null,
  create_time DATE default sysdate not null,
  sourceid    VARCHAR2(10),
  sex         VARCHAR2(50),
  birth_day   VARCHAR2(50),
  police_addr VARCHAR2(500)
);
-- Add comments to the columns 
comment on column CPDB_DS.T_DS_NCIIC_RESULT.trade_id
  is '�ӿڽ��׺�';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.cardno
  is '���֤��';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.name
  is '����';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.card_check
  is '���֤��ѯ���';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.name_check
  is '������ѯ���';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.error_mesg
  is '��ѯ����ԭ��';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.status
  is '״̬��00��ȫһ�£�01���֤��һ�µ�������һ�£�02�����޴˺�';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.image_file
  is '��Ƭ';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.create_time
  is '����ʱ��';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.sourceid
  is '����Դid:01����;02����';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.sex
  is '�Ա�';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.birth_day
  is '����';
comment on column CPDB_DS.T_DS_NCIIC_RESULT.police_addr
  is '��ַ';
-- Create/Recreate indexes 
create index CPDB_DS.IDX_DS_NCIIC_CARDNO1 on CPDB_DS.T_DS_NCIIC_RESULT (CARDNO);
create index CPDB_DS.IDX_DS_NCIIC_TRADEID1 on CPDB_DS.T_DS_NCIIC_RESULT (TRADE_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table CPDB_DS.T_DS_NCIIC_RESULT  add constraint PK_DS_NCIIC_ID1 primary key (ID) using index ;
