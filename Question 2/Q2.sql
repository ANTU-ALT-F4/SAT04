--CAU 1:
CREATE DATABASE MaterialStoresManagement
GO
USE MaterialStoresManagement
GO

--CAU 2:
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BILL') and o.name = 'FK_BILL_CREATE_EMPLOYEE')
alter table BILL
   drop constraint FK_BILL_CREATE_EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BILL') and o.name = 'FK_BILL_PAY_CUSTOMER')
alter table BILL
   drop constraint FK_BILL_PAY_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BILL_DETAIL') and o.name = 'FK_BILL_DET_BILL_DETA_BILL')
alter table BILL_DETAIL
   drop constraint FK_BILL_DET_BILL_DETA_BILL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BILL_DETAIL') and o.name = 'FK_BILL_DET_BILL_DETA_MATERIAL')
alter table BILL_DETAIL
   drop constraint FK_BILL_DET_BILL_DETA_MATERIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IMPROTSLIP_DETAIL') and o.name = 'FK_IMPROTSL_IMPROTSLI_IMPORT_S')
alter table IMPROTSLIP_DETAIL
   drop constraint FK_IMPROTSL_IMPROTSLI_IMPORT_S
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('IMPROTSLIP_DETAIL') and o.name = 'FK_IMPROTSL_IMPROTSLI_MATERIAL')
alter table IMPROTSLIP_DETAIL
   drop constraint FK_IMPROTSL_IMPROTSLI_MATERIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATERIALS') and o.name = 'FK_MATERIAL_BELONG_TYPE_OF_')
alter table MATERIALS
   drop constraint FK_MATERIAL_BELONG_TYPE_OF_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_INCLUDE_IMPORT_S')
alter table "ORDER"
   drop constraint FK_ORDER_INCLUDE_IMPORT_S
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_MAKE_EMPLOYEE')
alter table "ORDER"
   drop constraint FK_ORDER_MAKE_EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"ORDER"') and o.name = 'FK_ORDER_OF_SUPPLIER')
alter table "ORDER"
   drop constraint FK_ORDER_OF_SUPPLIER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDER_DETAIL') and o.name = 'FK_ORDER_DE_ORDER_DET_ORDER')
alter table ORDER_DETAIL
   drop constraint FK_ORDER_DE_ORDER_DET_ORDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ORDER_DETAIL') and o.name = 'FK_ORDER_DE_ORDER_DET_MATERIAL')
alter table ORDER_DETAIL
   drop constraint FK_ORDER_DE_ORDER_DET_MATERIAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BILL')
            and   name  = 'CREATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index BILL.CREATE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BILL')
            and   name  = 'PAY_FK'
            and   indid > 0
            and   indid < 255)
   drop index BILL.PAY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BILL')
            and   type = 'U')
   drop table BILL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BILL_DETAIL')
            and   name  = 'BILL_DETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index BILL_DETAIL.BILL_DETAIL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BILL_DETAIL')
            and   name  = 'BILL_DETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BILL_DETAIL.BILL_DETAIL2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BILL_DETAIL')
            and   type = 'U')
   drop table BILL_DETAIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMERS')
            and   type = 'U')
   drop table CUSTOMERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLOYEE')
            and   type = 'U')
   drop table EMPLOYEE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('IMPORT_SLIP')
            and   type = 'U')
   drop table IMPORT_SLIP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IMPROTSLIP_DETAIL')
            and   name  = 'IMPROTSLIP_DETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index IMPROTSLIP_DETAIL.IMPROTSLIP_DETAIL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('IMPROTSLIP_DETAIL')
            and   name  = 'IMPROTSLIP_DETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index IMPROTSLIP_DETAIL.IMPROTSLIP_DETAIL2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('IMPROTSLIP_DETAIL')
            and   type = 'U')
   drop table IMPROTSLIP_DETAIL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATERIALS')
            and   name  = 'BELONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATERIALS.BELONG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATERIALS')
            and   type = 'U')
   drop table MATERIALS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'INCLUDE_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".INCLUDE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".OF_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"ORDER"')
            and   name  = 'MAKE_FK'
            and   indid > 0
            and   indid < 255)
   drop index "ORDER".MAKE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"ORDER"')
            and   type = 'U')
   drop table "ORDER"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDER_DETAIL')
            and   name  = 'ORDER_DETAIL_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDER_DETAIL.ORDER_DETAIL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ORDER_DETAIL')
            and   name  = 'ORDER_DETAIL2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ORDER_DETAIL.ORDER_DETAIL2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ORDER_DETAIL')
            and   type = 'U')
   drop table ORDER_DETAIL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUPPLIER')
            and   type = 'U')
   drop table SUPPLIER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TYPE_OF_GOODS')
            and   type = 'U')
   drop table TYPE_OF_GOODS
go

/*==============================================================*/
/* Table: BILL                                                  */
/*==============================================================*/
create table BILL (
   CODE_BILL            char(10)             not null,
   CODE_CUSTOMERS       varchar(10)          not null,
   CODE_EMPLIYEE        varchar(10)          not null,
   DATE                 datetime             null,
   TOTAL_AMOUNT         decimal              null,
   constraint PK_BILL primary key (CODE_BILL)
)
go

/*==============================================================*/
/* Index: PAY_FK                                                */
/*==============================================================*/




create nonclustered index PAY_FK on BILL (CODE_CUSTOMERS ASC)
go

/*==============================================================*/
/* Index: CREATE_FK                                             */
/*==============================================================*/




create nonclustered index CREATE_FK on BILL (CODE_EMPLIYEE ASC)
go

/*==============================================================*/
/* Table: BILL_DETAIL                                           */
/*==============================================================*/
create table BILL_DETAIL (
   CODE_MATERIALS       varchar(10)          not null,
   CODE_BILL            char(10)             not null,
   QUANTITY             int                  null,
   UNIT_PRICE           float                null,
   constraint PK_BILL_DETAIL primary key (CODE_MATERIALS, CODE_BILL)
)
go

/*==============================================================*/
/* Index: BILL_DETAIL2_FK                                       */
/*==============================================================*/




create nonclustered index BILL_DETAIL2_FK on BILL_DETAIL (CODE_MATERIALS ASC)
go

/*==============================================================*/
/* Index: BILL_DETAIL_FK                                        */
/*==============================================================*/




create nonclustered index BILL_DETAIL_FK on BILL_DETAIL (CODE_BILL ASC)
go

/*==============================================================*/
/* Table: CUSTOMERS                                             */
/*==============================================================*/
create table CUSTOMERS (
   CODE_CUSTOMERS       varchar(10)          not null,
   NAME                 varchar(150)         null,
   constraint PK_CUSTOMERS primary key (CODE_CUSTOMERS)
)
go

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE (
   CODE_EMPLIYEE        varchar(10)          not null,
   NAME                 varchar(150)         null,
   constraint PK_EMPLOYEE primary key (CODE_EMPLIYEE)
)
go

/*==============================================================*/
/* Table: IMPORT_SLIP                                           */
/*==============================================================*/
create table IMPORT_SLIP (
   CODE_IMPORT_SLIP     varchar(10)          not null,
   DATE                 datetime             null,
   constraint PK_IMPORT_SLIP primary key (CODE_IMPORT_SLIP)
)
go

/*==============================================================*/
/* Table: IMPROTSLIP_DETAIL                                     */
/*==============================================================*/
create table IMPROTSLIP_DETAIL (
   CODE_MATERIALS       varchar(10)          not null,
   CODE_IMPORT_SLIP     varchar(10)          not null,
   QUANTITY             int                  null,
   UNIT_PRICE           float                null,
   constraint PK_IMPROTSLIP_DETAIL primary key (CODE_MATERIALS, CODE_IMPORT_SLIP)
)
go

/*==============================================================*/
/* Index: IMPROTSLIP_DETAIL2_FK                                 */
/*==============================================================*/




create nonclustered index IMPROTSLIP_DETAIL2_FK on IMPROTSLIP_DETAIL (CODE_MATERIALS ASC)
go

/*==============================================================*/
/* Index: IMPROTSLIP_DETAIL_FK                                  */
/*==============================================================*/




create nonclustered index IMPROTSLIP_DETAIL_FK on IMPROTSLIP_DETAIL (CODE_IMPORT_SLIP ASC)
go

/*==============================================================*/
/* Table: MATERIALS                                             */
/*==============================================================*/
create table MATERIALS (
   CODE_MATERIALS       varchar(10)          not null,
   TYPE_CODE            varchar(10)          not null,
   NAME                 varchar(150)         null,
   UNIT                 varchar(50)          null,
   constraint PK_MATERIALS primary key (CODE_MATERIALS)
)
go

/*==============================================================*/
/* Index: BELONG_FK                                             */
/*==============================================================*/




create nonclustered index BELONG_FK on MATERIALS (TYPE_CODE ASC)
go

/*==============================================================*/
/* Table: "ORDER"                                               */
/*==============================================================*/
create table "ORDER" (
   CODE_ORDER           varchar(10)          not null,
   CODE_EMPLIYEE        varchar(10)          not null,
   CODE_SUPPLIER        varchar(10)          not null,
   CODE_IMPORT_SLIP     varchar(10)          not null,
   DATE                 datetime             null,
   constraint PK_ORDER primary key (CODE_ORDER)
)
go

/*==============================================================*/
/* Index: MAKE_FK                                               */
/*==============================================================*/




create nonclustered index MAKE_FK on "ORDER" (CODE_EMPLIYEE ASC)
go

/*==============================================================*/
/* Index: OF_FK                                                 */
/*==============================================================*/




create nonclustered index OF_FK on "ORDER" (CODE_SUPPLIER ASC)
go

/*==============================================================*/
/* Index: INCLUDE_FK                                            */
/*==============================================================*/




create nonclustered index INCLUDE_FK on "ORDER" (CODE_IMPORT_SLIP ASC)
go

/*==============================================================*/
/* Table: ORDER_DETAIL                                          */
/*==============================================================*/
create table ORDER_DETAIL (
   CODE_MATERIALS       varchar(10)          not null,
   CODE_ORDER           varchar(10)          not null,
   QUANTITY             int                  null,
   constraint PK_ORDER_DETAIL primary key (CODE_MATERIALS, CODE_ORDER)
)
go

/*==============================================================*/
/* Index: ORDER_DETAIL2_FK                                      */
/*==============================================================*/




create nonclustered index ORDER_DETAIL2_FK on ORDER_DETAIL (CODE_MATERIALS ASC)
go

/*==============================================================*/
/* Index: ORDER_DETAIL_FK                                       */
/*==============================================================*/




create nonclustered index ORDER_DETAIL_FK on ORDER_DETAIL (CODE_ORDER ASC)
go

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER (
   CODE_SUPPLIER        varchar(10)          not null,
   NAME                 varchar(150)         null,
   ADDRESS              varchar(250)         null,
   constraint PK_SUPPLIER primary key (CODE_SUPPLIER)
)
go

/*==============================================================*/
/* Table: TYPE_OF_GOODS                                         */
/*==============================================================*/
create table TYPE_OF_GOODS (
   TYPE_CODE            varchar(10)          not null,
   TYPE_NAME            varchar(150)         null,
   constraint PK_TYPE_OF_GOODS primary key (TYPE_CODE)
)
go

alter table BILL
   add constraint FK_BILL_CREATE_EMPLOYEE foreign key (CODE_EMPLIYEE)
      references EMPLOYEE (CODE_EMPLIYEE)
go

alter table BILL
   add constraint FK_BILL_PAY_CUSTOMER foreign key (CODE_CUSTOMERS)
      references CUSTOMERS (CODE_CUSTOMERS)
go

alter table BILL_DETAIL
   add constraint FK_BILL_DET_BILL_DETA_BILL foreign key (CODE_BILL)
      references BILL (CODE_BILL)
go

alter table BILL_DETAIL
   add constraint FK_BILL_DET_BILL_DETA_MATERIAL foreign key (CODE_MATERIALS)
      references MATERIALS (CODE_MATERIALS)
go

alter table IMPROTSLIP_DETAIL
   add constraint FK_IMPROTSL_IMPROTSLI_IMPORT_S foreign key (CODE_IMPORT_SLIP)
      references IMPORT_SLIP (CODE_IMPORT_SLIP)
go

alter table IMPROTSLIP_DETAIL
   add constraint FK_IMPROTSL_IMPROTSLI_MATERIAL foreign key (CODE_MATERIALS)
      references MATERIALS (CODE_MATERIALS)
go

alter table MATERIALS
   add constraint FK_MATERIAL_BELONG_TYPE_OF_ foreign key (TYPE_CODE)
      references TYPE_OF_GOODS (TYPE_CODE)
go

alter table "ORDER"
   add constraint FK_ORDER_INCLUDE_IMPORT_S foreign key (CODE_IMPORT_SLIP)
      references IMPORT_SLIP (CODE_IMPORT_SLIP)
go

alter table "ORDER"
   add constraint FK_ORDER_MAKE_EMPLOYEE foreign key (CODE_EMPLIYEE)
      references EMPLOYEE (CODE_EMPLIYEE)
go

alter table "ORDER"
   add constraint FK_ORDER_OF_SUPPLIER foreign key (CODE_SUPPLIER)
      references SUPPLIER (CODE_SUPPLIER)
go

alter table ORDER_DETAIL
   add constraint FK_ORDER_DE_ORDER_DET_ORDER foreign key (CODE_ORDER)
      references "ORDER" (CODE_ORDER)
go

alter table ORDER_DETAIL
   add constraint FK_ORDER_DE_ORDER_DET_MATERIAL foreign key (CODE_MATERIALS)
      references MATERIALS (CODE_MATERIALS)
go

--CAU 3:
INSERT INTO SUPPLIER VALUES('S01','NHA CUNG CAP 1','VINH LONG'),
							('S02','NHA CUNG CAP 1','VINH LONG'),
							('S03','NHA CUNG CAP 1','VINH LONG')
SELECT * FROM SUPPLIER

INSERT INTO CUSTOMERS VALUES('CUS01','KHACH HANG 1'),
							('CUS02','KHACH HANG 2'),
							('CUS03','KHACH HANG 3')
SELECT * FROM CUSTOMERS

INSERT INTO EMPLOYEE VALUES('EM01','NHAN VIEN 1'),
							('EM02','NHAN VIEN 2'),
							('EM03','NHAN VIEN 3')
SELECT * FROM EMPLOYEE

INSERT INTO TYPE_OF_GOODS VALUES('TYPE01','VAT TU 1'),
								('TYPE02','VAT TU 2'),
								('TYPE03','VAT TU 3')
SELECT * FROM TYPE_OF_GOODS

INSERT INTO MATERIALS VALUES ('MA01','TYPE01','Xi mang','Bao'),
							 ('MA02','TYPE02','Cat','Xe'),
							 ('MA03','TYPE03','Da','Xe')
SELECT * FROM MATERIALS

INSERT INTO IMPORT_SLIP VALUES ('IM1','2022-12-25'), 
							  ('IM2','2022-12-25'),
							  ('IM3','2022-12-25')
SELECT * FROM IMPORT_SLIP

INSERT INTO [ORDER] VALUES('ORD01','EM01','S01','IM1','2022-09-25'),
						  ('ORD02','EM02','S02','IM2','2020-09-25'),
						  ('ORD03','EM03','S03','IM3','2020-12-25')

SELECT * FROM [ORDER]

INSERT INTO ORDER_DETAIL VALUES ('MA01','ORD01','6'),
								('MA02','ORD02','10'),
								('MA03','ORD03','11')
SELECT *FROM ORDER_DETAIL




INSERT INTO IMPROTSLIP_DETAIL VALUES('MA01','IM1',6,230000),
									('MA02','IM2',8,340000),
									('MA03','IM3',4,330000)
SELECT * FROM IMPROTSLIP_DETAIL

INSERT INTO BILL VALUES ('BILL01','CUS01','EM01','2022-09-25',89),
						('BILL02','CUS02','EM02','2020-09-25',90),
						('BILL03','CUS03','EM03','2020-12-25',99)
SELECT * FROM BILL

INSERT INTO BILL_DETAIL VALUES  ('MA01','BILL01',60,60000),
								('MA02','BILL02',74,74000),
								('MA03','BILL03',80,80000)
SELECT * FROM BILL_DETAIL

--CAU 4:
SELECT * FROM MATERIALS order by NAME asc
--CAU 5:
CREATE VIEW [ORDER_v1]
AS
	SELECT CODE_ORDER, CODE_EMPLIYEE, CODE_SUPPLIER, CODE_IMPORT_SLIP, DATE FROM [ORDER] WHERE MONTH(DATE) = '9' AND YEAR(DATE)='2020'

SELECT * FROM [ORDER_v1]

-- CAU 6:
CREATE PROC NEW_MATERIALS(
   @CODE_MATERIALS       varchar(10),
   @TYPE_CODE            varchar(10),
   @NAME                 varchar(150),
   @UNIT                 varchar(50)
)AS
	IF NOT EXISTS (SELECT * FROM MATERIALS WHERE CODE_MATERIALS = @CODE_MATERIALS)
	INSERT INTO MATERIALS (CODE_MATERIALS, TYPE_CODE, NAME, UNIT) VALUES (@CODE_MATERIALS,@TYPE_CODE,@NAME,@UNIT)
	ELSE PRINT(N'Có Lỗi Đâu đó vui lòng kiểm tra lại')

EXEC NEW_MATERIALS 'MA04','TYPE01','Xi Mang Vinh Long','Bao'

SELECT * FROM MATERIALS