
		select *
		from member
		where m_id = #{m_id}
		and m_pass = #{m_pass}
	
	
	
		select m_id
		from member
		where email = #{to}		
	
		select *
		from member
		where m_id = #{m_id}		
	
		select m_pass
		from member
		where m_id = #{m_id}	
		and email = #{to}	
	
		update member set
			m_pass = #{m_pass_new}
		where m_id = #{m_id}				
	
		update member set
			m_pass = #{m_pass},
			email = #{email},
			m_phonenumber = #{m_phonenumber}
		where m_id = #{m_id};				
		
	
		update member set
			m_pass = #{m_pass},			
			m_name = #{buyerName}
		where m_id = #{m_id}				
	
	
	
	
	
		select m_point
		from member
		where m_id = #{m_id}			
	
		update member set
			m_point = #{point} + #{pointAdd}
		where m_id = #{m_id}				
	
	