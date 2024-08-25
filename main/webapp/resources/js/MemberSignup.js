
		function CheckID(TextBoxControl, showPop, disableNullAlert, valueReset)
		{
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length ==0)
			{
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			
			if(TextBoxControl.value.indexOf(' ') >= 0)
			{
				TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
			  TextBoxControl.focus();
		
				return false;
			}

			if (inputValue.length < 4 || inputValue.length > 12) {
				if(valueReset){TextBoxControl.value="";}
				TextBoxControl.focus();
				return false;
			}
			if(showPop){
				pop = window.open ('Popup/CheckID.aspx?memb_id=' + inputValue,'CheckID','width=500,height=250');
				pop.focus();
			}
			return true;				
		}
		
		function CheckEmail(TextBoxID, TextBoxDomain, ComboBoxDomain, showPop, disableNullAlert)
		{			
			emailID = TextBoxID.value.replace(/ /g, "") ;
			if (disableNullAlert && emailID.length ==0) {return false;}

			if(emailID.length ==0)
			{
				alert("�̸��� ���̵� �Է��ϼ���");
				TextBoxID.focus();
				return false;		
			}
			emailID = TextBoxID.value

			if(ComboBoxDomain.value.length == 0)
			{
				alert("�̸��� �������� �����ϼ���");
				ComboBoxDomain.focus();
				return false;			
			}
			if(emailID.indexOf(".")==0 || emailID.indexOf(";")>-1 || emailID.indexOf(" ")>-1 || emailID.replace(/[A-Za-z0-9._\-]/g,"").length!=0)
			{
				alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
				TextBoxID.focus();
				return false;
			}
			if(ComboBoxDomain.value == "direct_input") {emailDomain=TextBoxDomain.value;}
			else {emailDomain=ComboBoxDomain.value;}

			if(emailDomain.indexOf(".")<1 || emailDomain.indexOf(".")>= emailDomain.length-1 || emailDomain.indexOf(";")>-1
				|| emailDomain.indexOf(" ") >-1 
				|| emailDomain.charAt(emailDomain.length-1) == "."
				|| emailDomain.replace(/[A-Za-z0-9._\-]/g,"").length!=0)
			{
				alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
				TextBoxDomain.focus();
				return false;
			}
			
			//3.�ߺ�üũ �˾� ǥ��
			if(showPop){
				pop = window.open ('Popup/CheckEmail.aspx?email=' + emailID+ '@' + emailDomain,'CheckEmail','width=500,height=250');
				pop.focus();
			}
			return true;	
		}	
		
		function CheckName(TextBoxControl, disableNullAlert) {
			inputValue = TextBoxControl.value;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length < 2)
			{	
				alert("�̸��� 2�� �̻��̾�� �մϴ�.") ;
				TextBoxControl.value="";
				TextBoxControl.focus();
				return false;		
			}
			
			return true;
		}
		
		function ShowHideQuestionText(ComboBox, SpanQuestion, TextBoxQuestion, TextBoxAnswer)
		{
			if(ComboBox.value == "direct_input")
			{
				SpanQuestion.style.display='block';
				TextBoxQuestion.focus();
			}
			else 
			{
				SpanQuestion.style.display='none';
				TextBoxAnswer.focus();
			}
		}
		
		function ShowHideEmailDomainText(ComboBox, SpanDisplay1, SpanDisplay2, SpanDisplay3, TextBoxEmailDomain)
		{
			if(ComboBox.value == "direct_input")
			{
				ShowEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3);
				TextBoxEmailDomain.value="";
				TextBoxEmailDomain.focus();
			}
			else 
			{
				HideEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3);
			}
		}
		
		/*[�̸��� ������ UI ���� (�����Է� �����)]*/
		function HideEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3)
		{
			SpanDisplay1.style.display='none';
			SpanDisplay2.style.display='none';
			SpanDisplay3.style.display='none';
		}
		/*[�̸��� ������ UI ���� (�����Է� ���̱�]*/
		function ShowEmailDomainText(SpanDisplay1, SpanDisplay2, SpanDisplay3)
		{
			SpanDisplay1.style.display='block';
			SpanDisplay2.style.display='block';
			SpanDisplay3.style.display='block';
		}
		
		/*[���ڰ����θ� �����Ǿ����� ����]*/
		function CheckOnlyNumber(TextBoxControl, disableNullAlert)
		{	
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if(inputValue.replace(/\d/g,"").length!=0)
			{
				alert("���ڸ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}	
			return true ;
		}
		
		/*[���� ��Ʈ�ѷ� Ŀ�� �̵�]*/
		function MoveToNextControl(Control1, Control2, count)
		{
			if(Control1.value.length==count) 
			{
				Control2.focus();
			}
		}		
		
		/*[�ֹε�Ϲ�ȣ �� 6�� ����]*/
		function CheckSsn1(TextBoxControl, disableNullAlert)
		{		
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("�ֹε�Ϲ�ȣ�� �־��ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=6) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� 6���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			
			return true ;
		}
		
		/*[�ֹε�Ϲ�ȣ �� 7�� ����]*/
		function CheckSsn2(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length !=7) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� 7���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			// 0,9�϶��� ���� ó��(1800��� ����ڴ� �����ϴ� ������ ����)
			if ((inputValue.charAt(0)=='9') || (inputValue.charAt(0)=='0')) {
				alert("�߸��� ����Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			return true ;
		}

		/*[���ε�Ϲ�ȣ �� 6�� ����]*/
		function CheckSsn1Company(TextBoxControl, disableNullAlert)
		{		
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("���ε��(������ֹ�)��ȣ ���ڸ��� �Է��ϼ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=6) {
				alert("���ε�Ϲ�ȣ ���ڸ��� 6���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[���ε�Ϲ�ȣ �� 7�� ����]*/
		function CheckSsn2Company(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}
			if (inputValue.length ==0) {
				alert("���ε��(������ֹ�)��ȣ ���ڸ��� �Է��ϼ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if (inputValue.length !=7) {
				alert("���ε�Ϲ�ȣ ���ڸ��� 7���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[����ڵ�Ϲ�ȣ �� 3�� ����]*/
		function CheckBusinessRegistrationNumber1(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length ==0) {
				alert("����ڵ�Ϲ�ȣ�� �־��ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}

			if (inputValue.length !=3) {
				alert("����ڵ�Ϲ�ȣ ���ڸ��� 3���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[����ڵ�Ϲ�ȣ �߰� 2�� ����]*/
		function CheckBusinessRegistrationNumber2(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=2) {
				alert("����ڵ�Ϲ�ȣ ���ڸ��� 2���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[����ڵ�Ϲ�ȣ �� 5�� ����]*/
		function CheckBusinessRegistrationNumber3(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=5) {
				alert("����ڵ�Ϲ�ȣ ���ڸ��� 5���Դϴ�. �ٽ� �Է����ּ���.") ;
				TextBoxControl.value="";
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[�����ȣ ��,�� 3�� ����]*/
		function CheckPostNo(TextBoxControl, disableNullAlert)
		{		
			inputValue =TextBoxControl.value.replace(/ /g, "") ;
			if (disableNullAlert && inputValue.length ==0) {return false;}

			if (inputValue.length !=3) {
				alert("�����ȣ�� �����ϼ���.") ;
				TextBoxControl.focus() ;
				return false ;
			}
			if(CheckOnlyNumber(TextBoxControl, disableNullAlert)==false) return false;
			return true ;
		}
		
		/*[�޴��� üũ]*/
		function CheckMobilePhone(ComboBox1, TextBox2, TextBox3, isOptional, disableNullAlert)
		{
			tel1 = ComboBox1.value.replace(/ /g, "") ;
			tel2 = TextBox2.value.replace(/ /g, "") ;
			tel3 = TextBox3.value.replace(/ /g, "") ;
			if(isOptional==false)
			{
				if(tel1.length==0){
					alert("�޴�����ȣ�� �Է��� �ּ���.") ;	
					ComboBox1.focus();	
					return false;
				}
			}
			if(tel1.length!=0){
				if(tel2.length ==0){
					alert("�޴�����ȣ�� Ȯ���Ͽ� �ּ���.") ;					
					TextBox2.value="";	
					TextBox2.focus();	
					return false;
				}
				if(tel3.length ==0){
					alert("�޴�����ȣ�� Ȯ���Ͽ� �ּ���.") ;					
					TextBox3.value="";	
					TextBox3.focus();	
					return false;
				}
			}
			if(tel1.length==0){
				if(tel2.length !=0 || tel3.length !=0){
				alert("�޴�����ȣ�� Ȯ���Ͽ� �ּ���.") ;
				ComboBox1.focus();	
				return false;
				}
			}		
			return true;
		}
		
		/*[�Ϲ���ȭ üũ]*/
		function CheckLinePhone(ComboBox1, TextBox2, TextBox3, isOptional, msg1)
		{
			tel1 = ComboBox1.value.replace(/ /g, "") ;
			tel2 = TextBox2.value.replace(/ /g, "") ;
			tel3 = TextBox3.value.replace(/ /g, "") ;
			
			if(isOptional==false)
			{
				if(tel1.length==0){
					alert(msg1+"�� �Է��� �ּ���.") ;	
					ComboBox1.focus();	
					return false;
				}
			}
			if(tel1.length!=0){
				if(tel2.length==0){
					alert(msg1+"�� Ȯ���Ͽ� �ּ���.") ;	
					TextBox2.value="";	
					TextBox2.focus();	
					return false;
				}
				if(tel1.indexOf("1")!=0 && tel3.length==0){
					alert(msg1+"�� Ȯ���Ͽ� �ּ���.") ;	
					TextBox3.value="";	
					TextBox3.focus();	
					return false;
				}
			}			
			if(tel1.length==0){
				if(tel2.length !=0 || tel3.length !=0){
					alert(msg1+"�� Ȯ���Ͽ� �ּ���.") ;
					ComboBox1.focus();	
					return false;
				}
			}
			return true;
		}		
		
		//(�ϴ� 2006-02-09�� asp �״�� ���, ���� ���� �ʿ�)
		function CheckValidSSN( vSSN )
		{
			var strSSN = vSSN.toString();
			a = strSSN.substring(0, 1);
			b = strSSN.substring(1, 2);
			c = strSSN.substring(2, 3);
			d = strSSN.substring(3, 4);
			e = strSSN.substring(4, 5);
			f = strSSN.substring(5, 6);
			g = strSSN.substring(6, 7);
			h = strSSN.substring(7, 8);
			i = strSSN.substring(8, 9);
			j = strSSN.substring(9, 10);
			k = strSSN.substring(10, 11);
			l = strSSN.substring(11, 12);
			m = strSSN.substring(12, 13);
			month = strSSN.substring(2,4);
			day = strSSN.substring(4,6);
			strSSN1 = strSSN.substring(0, 7);
			strSSN2 = strSSN.substring(7, 13);
		
			// 482 �ܱ��ε���� check
			if(g>=5 && g<=8)
			{
				if(CheckForeignSSN(strSSN))
					return 'Y';
				else
					return 'N';
			}else{
				/* ���� valid check */
				if(month <= 0 || month > 12) return 'N';
				if(day <= 0 || day > 31) return 'N';
		
			/* �ֹε�ϵ��ڸ� ù��° ��ȣ ��ȿ�� üũ (1,2,3,4) are only valid  */
				if(g > 4 || g == 0) return 'N';
			
				/* �ֹε�Ϲ�ȣ�� ������ ���� ������ �Ǵ� ��찡 �߻����� �ʵ��� */
				if (isNaN(strSSN1) || isNaN(strSSN2))
				{
					return 'N';
				}
			
				temp=a*2+b*3+c*4+d*5+e*6+f*7+g*8+h*9+i*2+j*3+k*4+l*5;
				temp=temp%11;
				temp=11-temp;
				temp=temp%10;
			    
				if(temp == m)
					return 'Y';
				else
					return 'N'; 
			}	        
		}

		// 482 �ܱ��ε���� check logic(�ϴ� 2006-02-09�� asp �״�� ���, ���� ���� �ʿ�)
		function CheckForeignSSN(fgnno)
		{
			if(fgnno.length!=13){	return false }	
			buf = new Array(13);
			for(i=0; i<13; i++) { buf[i]=parseInt(fgnno.charAt(i)); }
			if( (buf[11]!=7) && (buf[11]!=8) && (buf[11]!=9) ) {
					return false;
			}
			return true;
		}
		
		/*****************************************
			��й�ȣ ���� �Լ�
			2008-02-12 ��ö�� ���� �籸��
			2008-08-04 ������ ���� �籸��(BC1023) 
		******************************************/
		/*[�Է��� ��й�ȣ ��ȿ�� �˻�]*/
		
		var passwordType = 6;
		
		// �н����� Ŭ����
		function PasswordValidation()
		{
			this.strSecType = "" ;
			this.strHtml = "";

			this.setInit = function(){
				this.strSecType="";
				this.strHtml = "";
				if(document.getElementById("bmsgPassword1")!=null){document.getElementById("bmsgPassword1").innerHTML =objPw.getHtml("");}
				if(document.getElementById("bmsgPassword2")!=null){document.getElementById("bmsgPassword2").style.display="none";}
			}
		}

		PasswordValidation.prototype.getType = getPasswordValidateType;
		PasswordValidation.prototype.getHtml = getPasswordValidateHtml;
		
		var objPw = new PasswordValidation();

		function CheckPasswordWithIDnSSN(passwordControl, disableNullAlert, id, ssn)
		{
			if(!CheckPasswordWithID(passwordControl, disableNullAlert, id))
				return false;

			var pwd1=passwordControl.value;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //Ű���� ���ȵ��۽�
			{
				pwd1=GetPwdValue_K(passwordControl.form,passwordControl,"KingsE2E", "", "");
			}
			
			//SSN�� ��й�ȣ�� 4�� �̻� �ߺ��Ǵ��� üũ
			if(checkDuplicate(ssn, pwd1, 4) == false)
			{
				objPw.setInit();
				alert("������ ȸ������ ��ȣ�� ���Ͽ�\nȸ���� �ֹ�(����)��Ϲ�ȣ �Ϻΰ� ���Ե� ��й�ȣ�� ����� �� �����ϴ�.");
				passwordControl.value ="";
				passwordControl.value ="";
				passwordControl.focus();
				return false;
			}
			return true;
		}
		
		function CheckPasswordWithID(passwordControl, disableNullAlert, id)
		{
			if(!CheckPassword(passwordControl, disableNullAlert))
				return false;

			var pwd1=passwordControl.value;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //Ű���� ���ȵ��۽�
			{
				pwd1=GetPwdValue_K(passwordControl.form,passwordControl,"KingsE2E", "", "");
			}
			
			//ID�� ��й�ȣ�� 4�� �̻� �ߺ��Ǵ��� üũ
			if(checkDuplicate(id, pwd1, 4) == false)
			{
				alert("������ ȸ������ ��ȣ�� ���Ͽ�\nȸ���� ID �Ϻΰ� ���Ե� ��й�ȣ�� ����� �� �����ϴ�.");
				objPw.setInit();
				passwordControl.value ="";
				passwordControl.value ="";
				passwordControl.focus();
				return false;
			}
			return true;
		}
		
		function CheckPassword(passwordControl, disableNullAlert)
		{
			var bFlag = true ;
			if (disableNullAlert && passwordControl.value.length ==0) {return false;}

			var secType = objPw.getType(passwordControl) ; 
			if( secType.length == 2 ) 
			{				
				if(parseInt(secType.split("")[0]) < 2) //���Ұ�
				{
					bFlag=false;
				}
			}
			else
			{
				bFlag=false;
				
			}
			if(bFlag==false)
			{
				alert("��й�ȣ�� ����,����,Ư�������� �ΰ����� ������\n"+ passwordType+"~15�ڸ� ���ڷ� �Է��ϼž� �մϴ�");
				objPw.setInit();
				passwordControl.value = "" ; 
				passwordControl.focus();
				return false ; 
			}
			return true;
		}
		
		/*[�Է��� ��й�ȣ ��ġ �˻�]*/
		function CheckPasswordSync(TextBoxControl1, TextBoxControl2, disableNullAlert) 
		{
			var bFlag = true ;
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y') //Ű���� ���ȵ��۽�
			{
				if(stringOP_K('strcmp', TextBoxControl1, TextBoxControl2)==false) //kdefense_object.js
				{			
					bFlag=false;
				}
			}
			else
			{
				var pwd1 = TextBoxControl1.value.replace(/ /g, "") ;
				var	pwd2 = TextBoxControl2.value.replace(/ /g, "") ;

				if (disableNullAlert && pwd1.length ==0) {return false;}
				if (disableNullAlert && pwd2.length ==0) {return false;}
				if (pwd1.length == 0 || pwd1 != pwd2) 
				{
					bFlag=false;
				}
			}

			if(bFlag==false)
			{
				alert('�Է��Ͻ� �ΰ��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
				objPw.setInit();
				TextBoxControl1.value='';
				TextBoxControl2.value='';
				TextBoxControl1.focus();
				return false;
			}
			return true;
		}
		
		
		/* 2008-08-05 BC1023 ���� ��й�ȣüũ TypeCode ( ���ڸ� ���ڰ� 2 �̻��϶� ��밡�� ) 
		
		00	PW ���ڰ� 7�� �����϶� 
		01	���ڸ� �Էµ�����
		02	������ �Էµ�����
		03	Ư�����ڸ� �Էµ�����
		04	���ӵǴ� ���ڿ� ���ڸ� ������� �� (�Ϸ� ���� ����)
		05	������ ����, ���ڰ� 4�� �ݺ�������
		11	8�� �̻����� ���ڸ� �Էµ�����
		12	8�� �̻����� ������ �Էµ�����
		13	8�� �̻����� Ư�����ڸ� �Էµ�����
		21	8�� �̻����� ����, ����, Ư������ �� 2���� ���ڰ� ���Ե� ���
		31	8�� �̻����� ����, ����, Ư�����ڰ� ��� ���Ե� ���
		*/
		
		function getPasswordValidateType(objPassWord)
		{
			getPasswordValidateType(objPassWord, "");
		}

		// ��й�ȣŸ��üũ : Ű���� �Է½� ���� üũ (���ڿ���Ư���������Կ���,���ӹ���üũ��)
		// Ű���� �����۵���(��ȣȭ) Kdefense ���� �Լ��� �̿��Ͽ� ��ȿ���˻�
		// - ���� ����4�ڸ� ���� üũ�� Kdefense ���� �������� ���� : �Է°��� ��ȣȭ�Ͽ� üũ
		function getPasswordValidateType(objPassWord, type)
		{
			var pwdLength = objPassWord.value.length
			if (type == "E") passwordType = 8
			
			if(pwdLength==0)
				return "";

			//��ü����
			var isOnlyNum = false ;
			var isOnlyEng = false ;
			var isOnlySpc = false ;
			
			//Ű���� ���� �۵���
			if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
			{
				var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"; // ����
				var nums = "0123456789"; //����
				var percul = "!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]";//Ư������
					
				isOnlyNum = hasCharsOnly_K(objPassWord, nums);  //kdfense_object.js
				isOnlyEng = hasCharsOnly_K(objPassWord, chars);
				isOnlySpc = hasCharsOnly_K(objPassWord, percul);
			}
			else //Ű���� ���� ���۵���
			{
				var filterNum = /[0-9]/ ;			// ���ڸ� �������
				var filterEng = /[a-zA-Z]/;				// ������ �������
				var filterSpc = /[!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]/ ;  // Ư�����ڸ� ������� 

				var isIncNum = filterNum.test(objPassWord.value);
				var isIncEng = filterEng.test(objPassWord.value);
				var isIncSpc = filterSpc.test(objPassWord.value);
				
				isOnlyNum = isIncNum && !isIncEng && !isIncSpc;
				isOnlyEng = !isIncNum && isIncEng && !isIncSpc;
				isOnlySpc = !isIncNum && !isIncEng && isIncSpc;
			}
	
			//�ݺ�����üũ
			if( pwdLength > 3) //4�ڸ� ���� ���ӹ���,�ݺ����� �˻�
			{
				// Ű���� ���� �۵��� ��ȯ �Ͽ��˻�
				var tmpValue = objPassWord.value ;
				if(window.ActiveXObject && GetCookie('KeySecurity')=='Y')
				{
					tmpValue = GetPwdValue_K(objPassWord.form,objPassWord,"KingsE2E", "", ""); //��ȯ  //kdfense_object.js
				}
				
				if (checkSequence(tmpValue, 4)==false) //���ӵ� ����,���ڰ� 4�� �ݺ��Ǿ�����
					return "04";
				else if (checkRepetition(tmpValue, 4)==false) //������ ����,���ڰ� 4�� �ݺ�������
					return "05";
			}

			//�Ѱ��������� �Է�üũ
			if( pwdLength < passwordType )
			{
				if(isOnlyNum)  //���ڸ� �ԷµǾ�����
					return "01";  
				else if(isOnlyEng) //������ �ԷµǾ�����
					return "02";  
				else if(isOnlySpc) //Ư�����ڸ� �ԷµǾ�����
					return "03";  
				else
					return "00";   //6�� �����϶�
			}
			else  
			{
				if(isOnlyNum)  //���ڸ� �ԷµǾ����� //���
					return "11";  
				else if(isOnlyEng) //������ �ԷµǾ����� //���
					return "12";  
				else if(isOnlySpc) //Ư�����ڸ� �ԷµǾ����� //��� 
					return "13";  
			}

			//**3�ܰ� 
			if(pwdLength > 11 ) //12�� �̻����� ����, ����, Ư�������� �ΰ��� �̻� ���Ե� ���
				return "31";
			else //8�� �̻����� ����, ����, Ư�������� �ΰ��� �̻� ���Ե� ���
				return "21";
			
		}

		// ��й�ȣTypeCode�� ���� ǳ������ HTML ��ȯ
		function getPasswordValidateHtml(type)
		{
			var strBasicMsg = "��й�ȣ�� ����, ����, Ư������ ��<br />2������ �����Ͽ� "+ passwordType+"~15�� �̳��� �Է����ּ���.";
			var strOnlyNumMsg = "<span class=\"gray\">��й�ȣ�� ���ڸ� ����� �� �����ϴ�.</span>";
			var strOnlyEngMsg = "<span class=\"gray\">��й�ȣ�� ������ ����� �� �����ϴ�.</span>";
			var strOnlySpcMsg = "<span class=\"gray\">��й�ȣ�� Ư�����ڸ� ����� �� �����ϴ�.</span>";
			
			var strHeadHtml = "<strong class=\"fsm name\">���ȵ�� :</strong> <span class=\"gray3\"> </span> <strong class=\"fsm org\">";
			
			var strNotUse = "<img src=\"https://pics.auction.co.kr/icon/pw_use_00.gif\" alt=\"���Ұ�\" class=\"vm\"></strong><br />";
			var strWeak = "<img src=\"https://pics.auction.co.kr/icon/pw_use_01.gif\" alt=\"���\" class=\"vm\"></strong><br />";
			var strNomal = "<img src=\"https://pics.auction.co.kr/icon/pw_use_02.gif\" alt=\"����\" class=\"vm\"></strong><br />";
			var strSafe = "<img src=\"https://pics.auction.co.kr/icon/pw_use_03.gif\" alt=\"����\" class=\"vm\"></strong><br />";
			
			var strRetHtml = "";
			
			if(type=="")
				strRetHtml = strBasicMsg ;
			else if(type=="00")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">��й�ȣ�� "+ passwordType+"�� �̻� �Է����ּ���.</span>" ;
			else if(type=="01")
				strRetHtml = strHeadHtml + strNotUse + strOnlyNumMsg ;
			else if(type=="02")
				strRetHtml = strHeadHtml + strNotUse + strOnlyEngMsg ;
			else if(type=="03")
				strRetHtml = strHeadHtml + strNotUse + strOnlySpcMsg ;
			else if(type=="04")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">���ӵǴ� ���ڿ� ���ڸ�  ����Ͻ� �� �����ϴ�.</span>"
			else if(type=="05")
				strRetHtml = strHeadHtml + strNotUse + "<span class=\"gray\">������ ����, ���ڸ� �ݺ��ؼ� ����Ͻ� �� �����ϴ�.</span>";
			else if(type=="11")
				strRetHtml = strHeadHtml + strWeak + strOnlyNumMsg;
			else if(type=="12")
				strRetHtml = strHeadHtml + strWeak + strOnlyEngMsg;
			else if(type=="13")
				strRetHtml = strHeadHtml + strWeak + strOnlySpcMsg;
			else if(type=="21")
				strRetHtml = strHeadHtml + strNomal + "<span class=\"gray\">��밡���� ���������� ��й�ȣ�Դϴ�.</span>";
			else if(type=="31")
				strRetHtml = strHeadHtml + strSafe + "<span class=\"gray\">�ſ� ������ ��й�ȣ �Դϴ�.</span>" ;
			else 
				strRetHtml = strBasicMsg ;
		
			return "<p>"+strRetHtml+"</p>";
		}

		

		
		//���ĺ��� ���ڸ� ����ߴ��� üũ
		function checkAlphaNumeric(str)
		{
			//������ ���տ��� üũ
			//var filter1=/[^a-zA-Z0-9_]/	; // a~z,A-Z,0~9,"_"�� �ش��ϴ� ���ڸ� ����Ѵ�.
			var filter3=/[a-zA-Z]{1,15}/	;    //a~z �� �ϳ��� �����ϸ�, 4~15���� ���� ǥ����
 			var filter4=/[0-9]{1,15}/	;     //0~9 �� �ϳ��� �����ϸ�, 4~15���� ���� ǥ����
 			var filter5=/[!@#$%^&*()\"_\/+=\-\[\]{}';:?<>.,~`|\\]{1,15}/	;     //Ư�� ���� ������ 15��
 			

			if((filter3.test(str) && filter4.test(str) && filter5.test(str)))
			{
				return true;
			}
			
			return false;
		}

		//���� ���� üũ(��-abcd, 2345)
		function checkSequence(str,len)
		{
			var seqCnt=1;
			
			for(i=0;i < str.length;i++){
				next_p = str.charAt(i);		   
				next_char = (parseInt(next_p.charCodeAt(0)))+1;

				temp_p = str.charAt(i+1);    
				temp_char = (parseInt(temp_p.charCodeAt(0)));				
				if (next_char == temp_char)
						seqCnt = seqCnt + 1;
				else
						seqCnt = 1;

				if (seqCnt > len-1)
				{
    			return false;
				}
			}
			
			return true;
		}

		//�ݺ� ���� üũ(��-aaaa, 1111)
		function checkRepetition(str, len) {
			var repeatCnt=1;
			
			for(i=0;i < str.length;i++){
				temp_char = str.charAt(i);
				next_char = str.charAt(i+1);

				if (temp_char == next_char)
						repeatCnt = repeatCnt + 1;
				else
						repeatCnt = 1;
		        
				if (repeatCnt > len-1)
				{
    			return false;
				}
			}
			
			return true;
		}

		//�� �Է°��� �ߺ� ���� üũ(��-myid12, id12pwd)
		function checkDuplicate(str1, str2, len) {
			var temp="";

			if(str1.length < len)
				return true;

			for(i=0;i < str1.length-(len-1);i++)
			{
				temp = str1.substr(i, len);
				index = str2.indexOf(temp);
				
				if(index >= 0)	//�ߺ����ڸ� �˻��Ѵ�.
					return false;
			}

			return true;
		}

		// �ֹι�ȣ, ����ڹ�ȣ �ű� üũ ����(2008-06-24)
		// �ֹι�ȣ üũ
		function CheckNewValidSSN(ssn) 
		{
			ssn = ssn.replace(/ /g, "");
			
			if(ssn=="" || ssn==null || ssn.length!=13) {
				alert("�ֹε�Ϲ�ȣ�� �־��ּ���.");
				return false;
			}
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			var yy = jumin1.substr(0,2);        // �⵵
			var mm = jumin1.substr(2,2);        // ��
			var dd = jumin1.substr(4,2);        // ��
			var genda = jumin2.substr(0,1);     // ����
			var msg, ss, cc;
			
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(jumin1)) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 6�� �ƴ� ���
			if (jumin1.length != 6) {
				alert("�ֹι�ȣ ���ڸ� 6�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			// ù��° �ڷῡ�� ������(YYMMDD) ���� �� �⺻ ���� �˻�
			if (yy < "00" || yy > "99" ||
				mm < "01" || mm > "12" ||
				dd < "01" || dd > "31") {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
				return false;
			}
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(jumin2)) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 7�� �ƴ� ���
			if (jumin2.length != 7) {
				alert("�ֹι�ȣ ���ڸ� 7�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			// �����κ��� 1 ~ 4 �� �ƴ� ���
			if (genda < "1" || genda > "4") {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
				return false;
			}
			// ���� ��� - 1 �Ǵ� 2: 1900���, 3 �Ǵ� 4: 2000���
			cc = (genda == "1" || genda == "2") ? "19" : "20";
			// ù��° �ڷῡ�� ������(YYMMDD) ���� �� ��¥ ���� �˻�
			if (isYYYYMMDD(parseInt(cc+yy), parseInt(mm), parseInt(dd)) == false) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
				return false;
			}
			// Check Digit �˻�
			if (!isSSN(jumin1, jumin2)) {
				alert("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
				return false;
			}
			
			return true;
		}
		
		// ��ܱ��� ��ȣ üũ
		function CheckValidForeignSSN(ssn) 
		{
			ssn = ssn.replace(/ /g, "");
			
			if(ssn=="" || ssn==null || ssn.length!=13) {
				alert("�ֹε�Ϲ�ȣ�� �־��ּ���.");
				return false;
			}
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(jumin1)) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 6�� �ƴ� ���
			if (jumin1.length != 6) {
				alert("�ֹι�ȣ ���ڸ� 6�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(jumin2)) {
				alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 7�� �ƴ� ���
			if (jumin2.length != 7) {
				alert("�ֹι�ȣ ���ڸ� 7�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			
			var sum=0;
			var odd=0;
			
			buf = new Array(13);
			
			for(i=0; i<13; i++) { buf[i]=parseInt(ssn.charAt(i)); }
			
			odd = buf[7]*10 + buf[8];
			
			if(odd%2 != 0)
			{ 
				alert("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
				return false; 
			}
			
			multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
			
			for(i=0, sum=0; i<12; i++) { sum += (buf[i] *= multipliers[i]); }
			
			sum = 11 - (sum%11);
			if(sum >= 10) { sum -= 10; }
			sum += 2;
			if(sum >= 10) { sum -= 10; }
			
			if(sum != buf[12])
			{ 
				alert("��ȿ���� ���� �ֹι�ȣ�Դϴ�.");
				return false 
			}
			
			return true;
		}
	
		// 14�� �̸� üũ
		function CheckUnder14(ssn)
		{
			var jumin1 = ssn.substr(0,6);
			var jumin2 = ssn.substr(6,7);
			var yy     = jumin1.substr(0,2);
			var mm     = jumin1.substr(2,2);
			var dd     = jumin1.substr(4,2);
			var genda  = jumin2.substr(0,1);
	
			var today = new Date();
			var c_year  = today.getFullYear();
			var c_month = today.getMonth()+1;
			var c_day   = today.getDate();
			var c_yy, c_mm, c_dd;
			
			if (genda == "1" || genda == "2" || genda == "5" || genda == "6")
				c_yy = parseInt("19"+yy);
			else
				c_yy = parseInt("20"+yy);
				
			c_mm = parseInt(mm);
			c_dd = parseInt(dd);

			if(c_year-c_yy<14){
				alert("14������ �̼����ڴ� ȸ�������� �Ұ����մϴ�.");
				return false;
			}
			else if((c_year-c_yy==14)&&(c_mm>c_month)){
				alert("14������ �̼����ڴ� ȸ�������� �Ұ����մϴ�.");
				return false;
			}
			else if((c_year-c_yy==14)&&(c_mm==c_month)&&(c_dd>c_day)){
				alert("14������ �̼����ڴ� ȸ�������� �Ұ����մϴ�.");
				return false;
			}
			
			return true;
		}
		
		// ����ڵ�Ϲ�ȣ üũ
		function CheckValidBusinessRegistrationNumber(regiNumber) 
		{
			regiNumber = regiNumber.replace(/ /g, "");
			
			if(regiNumber=="" || regiNumber==null || regiNumber.length!=10) {
				alert("����ڹ�ȣ�� �־��ּ���.");
				return false;
			}
			var regiNumber1 = regiNumber.substr(0,3);
			var regiNumber2 = regiNumber.substr(3,2);
			var regiNumber3 = regiNumber.substr(5,5);
			
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(regiNumber1)) {
				alert("����ڹ�ȣ ù��° �ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 3�� �ƴ� ���
			if (regiNumber1.length != 3) {
				alert("����ڹ�ȣ ù��° �ڸ� 3�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(regiNumber2)) {
				alert("����ڹ�ȣ �ι�° �ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 2�� �ƴ� ���
			if (regiNumber2.length != 2) {
				alert("����ڹ�ȣ �ι�° �ڸ� 2�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
			// ���ڰ� �ƴ� ���� �Է��� ���
			if (!isNumeric(regiNumber3)) {
				alert("����ڹ�ȣ ����° �ڸ��� ���ڷ� �Է��ϼ���.");
				return false;
			}
			// ���̰� 5�� �ƴ� ���
			if (regiNumber3.length != 5) {
				alert("����ڹ�ȣ ����° �ڸ� 5�ڸ� �ٽ� �Է��� �ּ���.");
				return false;
			}
	
			var sum = 0;
			var getlist =new Array(10);
			var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
			
			for(var i=0; i<10; i++) { getlist[i] = regiNumber.substring(i, i+1); }
			for(var i=0; i<9; i++) { sum += getlist[i]*chkvalue[i]; }
			sum = sum + parseInt((getlist[8]*5)/10);
			sidliy = sum % 10;
			sidchk = 0;
			if(sidliy != 0) { sidchk = 10 - sidliy; }
			else { sidchk = 0; }
			if(sidchk != getlist[9]) 
			{
				alert("��ȿ���� ���� ����ڹ�ȣ�Դϴ�.");
				return false; 
			}
			
			return true;
		}
		
		// Trim �Լ�
		function TrimString(s)
		{
			var m = s.match(/^\s*(\S+(\s+\S+)*)\s*$/);
			return (m == null) ? "" : m[1];
		}
		
		function isYYYYMMDD(y, m, d) 
		{
			switch (m) {
				case 2:        // 2���� ���
					if (d > 29) return false;
					/*if (d == 29) {
							// 2�� 29�� ��� ���ذ� ���������� Ȯ��
							if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
								return false;
					}*/
					break;
				case 4:        // ���� ���� ���
				case 6:
				case 9:
				case 11:
					if (d == 31) return false;
			}
			// ū ���� ���
			return true;
		}
		
		function isNumeric(s) 
		{
			for (i=0; i<s.length; i++) {
				c = s.substr(i, 1);
				if (c < "0" || c > "9") return false;
			}
			return true;
		}
		
		function isLeapYear(y) 
		{
			if (y < 100)
			y = y + 1900;
			if ( (y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) ) {
				return true;
			} else {
				return false;
			}
		}
		
		function getNumberOfDate(yy, mm) 
		{
			month = new Array(29,31,28,31,30,31,30,31,31,30,31,30,31);
			if (mm == 2 && isLeapYear(yy)) mm = 0;
			return month[mm];
		}
		
		function isSSN(s1, s2) 
		{
			n = 2;
			sum = 0;
			for (i=0; i<s1.length; i++)
				sum += parseInt(s1.substr(i, 1)) * n++;
			for (i=0; i<s2.length-1; i++) {
				sum += parseInt(s2.substr(i, 1)) * n++;
				if (n == 10) n = 2;
			}
			c = 11 - sum % 11;
			if (c == 11) c = 1;
			if (c == 10) c = 0;
			if (c != parseInt(s2.substr(6, 1))) return false;
			else return true;
		}
	
    /*-----------------------------------------------------------------------------
    // ���� ��Ϲ�ȣ üũ - arguments[0] : ��Ϲ�ȣ ������
    // XXXXXX-XXXXXXX
    // @return : boolean
    //----------------------------------------------------------------------------*/
    String.prototype.isCorporationSSN = function() {
        var arg = arguments[0] ? arguments[0] : "";
        var corpnum = eval("this.match(/[0-9]{6}" + arg + "[0-9]{7}$/)");
        if(corpnum == null) {
            return false;
        }
        else {
            corpnum = this;
        }
        
        if(corpnum.length < 13)
        	return false;
        				
        var sum = 0;
        var num = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
        var last = parseInt(corpnum.charAt(12));
        for(var i = 0; i < 12; i++) {
            sum += parseInt(corpnum.charAt(i)) * num[i];
        }
        
        return ((10 - sum % 10) % 10 == last) ? true : false;
    }
    
    //���� ��Ϲ�ȣ üũ
    function ChecValidCorporationSSN(ssn)
  	{
  		return ssn.isCorporationSSN();
  	}	
  	
  	//�������� ����ǥ���� üũ(��������������������)
	function checkRepetitionHangeul(str) 
	{
		var pattern = /(��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��|��){2,}/;
		var reg = new RegExp(pattern);
		return !reg.test(str)
	}
 	
 	//�ݺ� ���� (��-aaaa) --ȸ�������� ���ּ� ����
 	function checkRepetitionForAddress(str, len) {
		var repeatCnt=1;

		for(i=0;i < str.length;i++){
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);

			if (temp_char == next_char)
				repeatCnt = repeatCnt + 1;
			else
				repeatCnt = 1;
		      
			if (repeatCnt > len-1)
			{
				if (isNaN(temp_char)) //������ ��츸 �ݺ����� üũ
				{
					return false;
				}
			}
		}
		return true;
	}				
	
 	//�ݺ� ���� (��- 000,0000,111,1111) --ȸ�������� ��ȭ��ȣ ���͸��� ����
 	function checkRepetitionForTel(str, len) {
		var repeatCnt=1;

		for(i=0;i < str.length;i++){
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);
			
			if (temp_char == next_char)
			{
				repeatCnt = repeatCnt + 1;
			}
			else
				repeatCnt = 1;
		      
			if (repeatCnt > len-1)
			{
				if (temp_char == "0" || temp_char == "1") //�Է°��� 0,1�� ����� �ݺ����ڸ� üũ
				{			
					if ((str.length > repeatCnt) && (temp_char != str.charAt(i+2))) //�ݺ���������� ��ü �Է°��� ���̰� ���� üũ
					{
						return true;
					}
					return false;
				}
			}
		}
		return true;
	}		
	
		
	//�ݺ� ���� (��-1111222, 1111356)
	function checkNumRepetition(str, len) {
		var repeatCnt=0;

		for(i=0;i < str.length;i++){
			
			temp_char = str.charAt(i);
			next_char = str.charAt(i+1);
							
		  if (!isNaN(temp_char)) 
		  {
				repeatCnt = repeatCnt + 1;
				if ((isNaN(next_char) && (repeatCnt <= len-1)) || (temp_char == " "))
				{
					repeatCnt=0;
				}
			}
		  else
				repeatCnt = 0;
		      
			if (repeatCnt > len-1)
			{
				return false;
			}
		}
		return true;
	}			