insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000001,'sys_public_logprint_switch','1','�Ƿ��ӡ��־:1��ӡ,0����ӡ','0753513de038453c820cf6869w3we342','sys_public_code','ϵͳ����-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000002,'sys_public_mock_switch','1','�Ƿ���mock�ӿ�:1��,0����','0753513de038453c820cf6869w3we342','sys_public_code','ϵͳ����-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000003,'sys_ds_max_error_num','30','dsӦ������Դerror�۶���ֵ','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000004,'sys_ds_error_expire_sec','300','dsӦ������Դerrorͳ����ʧЧʱ�� ��λ��','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000005,'sys_ds_sms_time_rate','5','dsӦ��smsƵ�ʣ���λ��','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000006,'sys_ds_jixin_url','http://121.201.18.234:9000/jxdata/api/auth/execute.do','����-���п���Ȩ����url','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000007,'sys_ds_jixin_merchkey','z5wJ3Ezk3rO7vmUaCLHnRwvopUhzL240','����-�̻�key','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000008,'sys_ds_jixin_merchno','0000000000000003','����-�̻���','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000009,'sys_ds_jixin_transcode','106','����-���ýӿں�','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000010,'sys_ds_jixin_version','0100','����-���ð汾��','0753513de038453c820cf6869w3we342','sys_ds_code','ϵͳdsӦ�ò���-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000011,'sys_public_env_timeout','5000','��ʱʱ��:��λ��','0753513de038453c820cf6869w3we342','sys_public_code','ϵͳ����-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000012,'sys_public_des_key','ctesrece','����key','0753513de038453c820cf6869w3we342','sys_public_code','ϵͳ����-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000013,'sys_public_encode_keys','cardNo,cardId','����code','0753513de038453c820cf6869w3we342','sys_public_code','ϵͳ����-����','3');

insert into cpdb_ds.t_sys_property_param(id,key_code,key_value,key_desc,ownerid,child_code,child_name,status)
values (1000016,'sys_public_gw_test_mock','0','�Ƿ���mock:1��,0����','1q53513de038453c820cf6869w3we342','sys_gw_code','ϵͳ����-gw','3');

commit;


update cpdb_ds.t_sys_property_model d set d.ownerid='1q53513de038453c820cf6869w3we342';
update cpdb_ds.t_sys_property_param m set m.ownerid='1q53513de038453c820cf6869w3we342';
commit;