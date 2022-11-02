CREATE TABLE product (
	id	VARCHAR2(20),
	id_ctg	NUMBER(3),
	pname	VARCHAR2(30),
	price	NUMBER(10),
	psubtitle	VARCHAR2(300),
	com_id	VARCHAR2,
	pstock	NUMBER(4)
);

CREATE TABLE member (
	id_member	VARCHAR2(20),
	mname	VARCHAR2(10),
	birthdate	DATE,
	email	VARCHAR2(30),
	tel	NUMBER(13),
	joindate	DATE,
	password	VARCHAR2(30)
);

CREATE TABLE p_order (
	ordno	NUMBER(16),
	id_member	VARCHAR2(20),
	orddate	DATE,
	pay_type	VARCHAR2(10),
	total_price	NUMBER
);

CREATE TABLE p_categories (
	id_ctg	NUMBER(3),
	ctg	VARCHAR2(30)
);

CREATE TABLE cart (
	id	VARCHAR2(20),
	pname	VARCHAR2(30),
	price	NUMBER(10),
	amount	NUMBER(3)
);

CREATE TABLE b_review (
	brvno	NUMBER(4),
	id_writer	VARCHAR2(20),
	brv_title	VARCHAR2(100),
	brv_content	VARCHAR2(300),
	brv_date	DATE,
	brv_hits	NUMBER,
	p_id	VARCHAR2(20)
);

CREATE TABLE b_qna (
	bqnano	NUMBER(4),
	id_qna_ctg	NUMBER,
	qna_title	VARCHAR2(100),
	sec_password	NUMBER(4),
	bqna_date	DATE,
	bqna_hits	NUMBER,
	bqna_lock	CHAR(1),
	answer	VARCHAR2(500),
	p_id	VARCHAR2(20)
);

CREATE TABLE qna_ctg (
	id_qna_ctg	NUMBER,
	qctg	VARCHAR2(10),
	qmgr	VARCHAR2(10)
);

CREATE TABLE company (
	com_id	VARCHAR2,
	com_address	VARCHAR2(100),
	com_tel	NUMBER
);

CREATE TABLE res_li (
	id_member	VARCHAR2(20),
	address	VARCHAR2(100),
	res_name	VARCHAR2(10),
	res_tel	NUMBER(13),
	require	VARCHAR2(30)
);

CREATE TABLE ord_li (
	ordno	NUMBER(16),
	id	VARCHAR2(20),
	p_cnt	NUMBER
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (id);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (id_member);

ALTER TABLE p_order ADD CONSTRAINT PK_P_ORDER PRIMARY KEY (ordno);

ALTER TABLE p_categories ADD CONSTRAINT PK_P_CATEGORIES PRIMARY KEY (id_ctg);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (id);

ALTER TABLE b_review ADD CONSTRAINT PK_B_REVIEW PRIMARY KEY (brvno);

ALTER TABLE b_qna ADD CONSTRAINT PK_B_QNA PRIMARY KEY (bqnano);

ALTER TABLE qna_ctg ADD CONSTRAINT PK_QNA_CTG PRIMARY KEY (id_qna_ctg);

ALTER TABLE company ADD CONSTRAINT PK_COMPANY PRIMARY KEY (com_id);

ALTER TABLE res_li ADD CONSTRAINT PK_RES_LI PRIMARY KEY (id_member);

ALTER TABLE ord_li ADD CONSTRAINT PK_ORD_LI PRIMARY KEY (ordno);

ALTER TABLE product ADD CONSTRAINT FK_cart_TO_product_1 FOREIGN KEY (id) REFERENCES cart (id);

ALTER TABLE res_li ADD CONSTRAINT FK_member_TO_res_li_1 FOREIGN KEY (id_member) REFERENCES member (id_member);

ALTER TABLE ord_li ADD CONSTRAINT FK_p_order_TO_ord_li_1 FOREIGN KEY (ordno) REFERENCES p_order (ordno);

--- 노트북 내용 ---
alter table p_order rename column id_memeber to id_member;
alter table p_order rename column res_id_mem to id_memeber;
alter table qna_ctg
drop column answer;
alter table b_qna add answer varchar2(500);
alter table b_qna add constraint pk_bqnano primary key (bqnano);
alter table res_li add constraint fk_id_member foreign key (id_member) references member (id_member);
alter table product add constraint fk_id foreign key (id) references cart (id);
alter table p_order add constraint pk_id_member foreign key (id_member) references member (id_member);
alter table product add constraint pk_com_id foreign key (com_id) references company (com_id);
alter table product add constraint pk_id_ctg foreign key (id_ctg) references p_categories (id_ctg);
alter table b_review add constraint pk_id foreign key (id) references product (id);
alter table b_qna add constraint pk_id foreign key (id) references product (id);
alter table b_qna add constraint pk_id_qna_ctg foreign key (id_qna_ctg) references qna_ctg (id_qna_ctg);
alter table b_review drop constraint fk_id;

alter table b_review
drop column id;
alter table b_qna
drop column id;