
		insert into cart (cart_no, p_no, m_id)
		values (seq_cart_no.nextval, #{p_no}, #{m_id})
	
	
	
		select c_com_no from computer_product 
		where c_com_name = #{productName}
	
	
		
		insert into c_product_purchase_percentage (no, c_com_no_ref)
		values (c_purchase_index.nextval, #{c_com_no})
	
	
	
		select count(c_com_no_ref) from c_product_purchase_percentage 
		where c_com_no_ref = #{c_com_no}
	
	
	
	
	
		select purchase_num from c_product_purchase_percentage 
		where c_com_no_ref = #{c_com_no}
	
	
		
		update c_product_purchase_percentage set
		purchase_num = #{purchase_num} + #{purchase_num_plus}	
	where c_com_no_ref = #{c_com_no}		
		
	
			
		update c_total_purchase set
		total = #{purchase_num_plus} + #{select_number}	
		where nok = #{nok}		
	
	
	
		select total from c_total_purchase 
		where nok = #{nok}
	
	
	
	
	
	
		select like_num from c_product_purchase_percentage 
		where c_com_no_ref = #{c_com_no}
	
	
			
		update c_product_purchase_percentage set
		like_num = #{like_num} + #{like_num_plus}	
	where c_com_no_ref = #{c_com_no}		
	
	
		
		update c_total_purchase set
		totallike = #{select_number} + #{like_num_plus}
		where nok = #{nok}		
	
	
	
		select totallike from c_total_purchase 
		where nok = #{nok}
	
	
	
	
		
		insert into c_com_comment_table (c_com_comment_no, c_com_comment_content, c_com_comment_writer, c_com_product)
		values (computer_comment_cno.nextval, #{c_com_comment_content}, #{m_id}, #{productName})
	
	
	
	
	
		select * from computer_product 
		where c_com_cate_no like #{c_com_cate_no} || '%'
		order by p_no asc
	
	
	
		select count(c_com_seller) from computer_product 
		where c_com_seller = #{c_com_seller}		
	
	
	
		select count(*) from c_com_comment_table 
		where c_com_product = #{c_com_product}
		order by c_com_comment_no asc		
	
	
	
		select count(*) from product_explain_table 
		where p_e_product = #{c_com_product}
		order by p_e_no asc		
	
	
	
		select * from computer_product 
		where p_no = #{p_no}		
	
	
	
		select cate_ref, cate_name from category 
		where cate_no = #{c_com_cate_no}		
	
	
	
		select * from computer_product 
		where c_com_name like '%' || #{c_com_name} || '%'
				and
				(c_com_cate_no like #{cate_no0} || '%'
				or c_com_cate_no like #{cate_no1} || '%'
				or c_com_cate_no like #{cate_no2} || '%'
				or c_com_cate_no like #{cate_no3} || '%'
				or c_com_cate_no like #{cate_no4} || '%'
				or c_com_cate_no like #{cate_no5} || '%')
				order by p_no asc				 
	
	
	
		select * from computer_product 
		where c_com_price between to_number(#{firstPrice}) and to_number(#{lastPrice}) 
				and
				(c_com_cate_no like #{cate_no0} || '%'
				or c_com_cate_no like #{cate_no1} || '%'
				or c_com_cate_no like #{cate_no2} || '%'
				or c_com_cate_no like #{cate_no3} || '%'
				or c_com_cate_no like #{cate_no4} || '%'
				or c_com_cate_no like #{cate_no5} || '%')
				order by p_no asc				 
	
	
	
		select * from computer_product 
		where c_com_seller = #{c_com_seller} 
				and
				(c_com_cate_no like #{cate_no0} || '%'
				or c_com_cate_no like #{cate_no1} || '%'
				or c_com_cate_no like #{cate_no2} || '%'
				or c_com_cate_no like #{cate_no3} || '%'
				or c_com_cate_no like #{cate_no4} || '%'
				or c_com_cate_no like #{cate_no5} || '%')
				order by p_no asc				 

	
	
		select * from computer_product where 
						c_com_cate_no like 
					#{cate_no0} || '%'
						or c_com_cate_no like 
					#{cate_no1} || '%'
						or c_com_cate_no like 
					#{cate_no2} || '%'
						or c_com_cate_no like 
					#{cate_no3} || '%'
						or c_com_cate_no like 
					#{cate_no4} || '%'
						or c_com_cate_no like 
					#{cate_no5} || '%'
						order by p_no asc		
	
		select * from category
		where cate_ref = #{cate_ref}
	
		select * from category where cate_ref = 
						#{cate_no0}
						or cate_ref =
						#{cate_no1}
						or cate_ref =
						#{cate_no2} 												
						or cate_ref =
						#{cate_no3} 												
						or cate_ref =
						#{cate_no4} 												
						or cate_ref =
						#{cate_no5} 																	
	
		select * from computer_product
		where p_no = #{p_no}
	
		select * from c_com_comment_table 
		where c_com_product = (select c_com_name from computer_product
			where p_no = #{p_no})
		order by c_com_comment_no asc
	
		select * from product_explain_table 
		where p_e_title like '%' || #{p_e_title} || '%'
		and p_e_product = #{p_e_product}
		and p_e_inquiry_status = #{p_e_inquiry_status}
		order by p_e_no asc
	
		select * from product_explain_table 
		where p_e_product = (select c_com_name from computer_product
			where p_no = #{p_no})
		order by p_e_no asc
	
		insert into product_explain_table(p_e_no, p_e_answer_status, p_e_inquiry_status, p_e_title, p_e_id, p_e_regdate, p_e_product, p_e_re)
		values (explain_table_cno.nextval,'답변예정',#{p_e_inquiry_status},#{p_e_title},#{p_e_id},sysdate,#{p_e_product},'미기입')
	
		update c_com_comment_table set
			c_com_comment_content = #{c_com_comment_content}
		where c_com_comment_no = #{c_com_comment_no}
	
		delete from c_com_comment_table
		where c_com_comment_no = #{c_com_comment_no}
	
		update product_explain_table set
			p_e_answer_status = '답변완료',
			p_e_re = #{p_e_re}
		where p_e_no = #{p_e_no}
	
	