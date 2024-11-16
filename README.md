
<img src="./aution_logo.png" width="100%" align="center"/>

1. # 개요💡
   __옥션 중고 장터를 롤 모델로 구성한 프로젝트입니다.__  
   : 예전부터 옥션 중고 장터의 시간이 카운트 되는 기능과 옥션의 경매 방식에 흥미를 가지고 있었고 꼭 한번은 만들고 싶다는 생각을 하고 있었습니다. 그러던 중 팀 프로젝트 주제로 중고 사이트가 선정되었고, 경매 부분만 따로 제가 맡게 되었습니다. 백엔드, 프론트엔드, 테이블 설계까지 개인 프로젝트의 개념으로 진행하게 되었습니다.   
   
   ![HTML5](https://img.shields.io/badge/html5-red.svg?style=for-the-badge&logo=html5&logoColor=white)
   ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
   ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
   ![JAVA](https://img.shields.io/badge/java-%231572B6.svg?style=for-the-badge&logo=java&logoColor=blue)
   ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
   ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
   ![Oralcle](https://img.shields.io/badge/oracle-%2300f.svg?style=for-the-badge&logo=oracle&logoColor=white)
   ![Spring](https://img.shields.io/badge/spring-green.svg?style=for-the-badge&logo=spring&logoColor=white)

1. # 테이블 설계📲
   <img src="aution_db.png" width="100%">

1. # 주요 기능🔍
   1) 메인화면 : 각 상품 별로 마감 시간이 카운트됩니다.   
   <br>
   <img src="item_time_count.gif" style="border:3px solid black;border-radius:9px;width:350px">    
   <br>
   <div style="border:2px solid black">
   현재 시간과 마감 시간의 차이를 계산한 후 setTimeout으로 초를 1씩 뺍니다.<br>
   초가 0이 되면 분에서 값을 가져옵니다.<br>
   분이 0이면 시간에서 값을 가져옵니다.<br>
   시간이 0이면 일에서 값을 가져옵니다. 이런 식으로 년까지 계산을 합니다.<br>
   단, 달의 경우 윤년이 있기 때문에 경매의 마감날짜 차를 1달을 넘기지 않습니다.<br>
   2월 28일날 등록을 했고 3월 4일이 마감일이면 월에 해당하는 일 수를 가져올 때 마감일의 전달 일 수를 가져오면 됩니다. 이 함수가 new Date(nowYear, nowMonth - 1, 0).getDate(); 입니다.<br>
   </div>
   <br>
   <br>
   <hr>
   3) 이미지 추가 : 상품 등록시 이미지를 드래그 해서 추가합니다.   
   <img src="image_up.gif" style="border:3px solid black;border-radius:9px;width:350px">    
   
   <br>
   <br>
      
   3) 남은 시간 추가 : 사용자가 입찰을 할 경우   
      
   <img src="time_add.gif" style="border:3px solid black;border-radius:9px;width:350px">   
   
   <br>
   <br>
      
   4) 입찰 종료 : 시간이 만료되면 진행 창이 나타나면서 현재화면은 비활성화 됩니다.   
   <img src="background_fade.gif" style="border:3px solid black;border-radius:9px;width:350px">   

   <br>
   <br>
   
   5) 결제 api를 이용하여 제 통장에서 돈이 빠져나가고 다음날 다시 들오게 됩니다.   
   <img src="payment.gif" style="border:3px solid black;border-radius:9px;width:350px">   
   
1. # 프로그램 설계
   <br>
   <img src="program_draft.png" style="border:3px solid black;border-radius:9px;width:100%">    
   
 



