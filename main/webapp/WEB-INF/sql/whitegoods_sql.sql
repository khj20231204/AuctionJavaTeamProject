create table whitegoods(
    w_no number primary key,
    w_name varchar2(100) not null,
    cate_no varchar2(50) references category(cate_no),
    w_price number not null,
    w_content varchar2(1000) not null,
    w_seller varchar2(50) references member(m_id),
    w_thumbimg varchar2(100),
    w_regdate timestamp default sysdate,
    p_no number not null
);



select p_no  , p_name , cate_no , p_price , p_content , p_seller , p_thumbimg , p_regdate , p_no from (
	select a.*
	from clothes_product a

	union all 

	select b.c_com_no  , b.c_com_name , b.c_com_cate_no , b.c_com_price , b.c_com_content , b.c_com_seller , b.c_com_pic , b.c_com_regdate , b.p_no
	from computer_product b 

	union all 

	select c1.* 
	from furniture_bed c1

	union all
	
	select c2.* 
	from furniture_interior c2
	
	union all
	
	select c3.*
	from furniture_kitchen c3
	
	union all
	
	select c4.*
	from furniture_life c4
	
	union all
	
	select d.*
	from whitegoods d
	);
	
	
select p_no  , p_name , cate_no , p_price , p_content , p_seller , p_thumbimg , p_regdate , p_no from (
	
	select a.*
	from clothes_product a
	
	union all 
	
	select b.c_com_no  , b.c_com_name , b.c_com_cate_no , b.c_com_price , b.c_com_content , b.c_com_seller , b.c_com_pic , b.c_com_regdate , b.p_no
	from computer_product b 
	
	union all 
	
	select c1.* 
	from furniture_bed c1
	
	union all
	
	select c2.* 
	from furniture_interior c2
	
	union all
	
	select c3.* 
	from furniture_kitchen c3
	
	union all
	
	select c4.* 
	from furniture_life c4
	
	union all
	
	select d.* 
	from whitegoods d
);