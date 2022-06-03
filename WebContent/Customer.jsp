<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>

<script type="text/javascript" src="js/viewprofile.js"></script>
<script type="text/javascript" src="js/balance.js"></script>

</head>
<body class="w3-light-grey " >
	<%
if(session.getAttribute("userid")!=null)
{
%>
	<%	
	String uid = String.valueOf(session.getAttribute("userid"));
	String wid = String.valueOf(session.getAttribute("wallet_id"));
	%>
	
	
	  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1><b>E_wallet</b></h1>
         <div class="w3-right w3-hide-small">
         	<div class="w3-bar-item w3-button">
      		<h3 >Availbal Balance</h3>
     		     <div id="manish">
     			
                </div>   
     		<button type="button" onclick="makeGetRequest()">View Balance</button> 
   			</div>
      <a href="#about" class="w3-bar-item w3-button"><b>wallet id: <%=wid %> </a>
      
      <img src="viewImage.jsp?id=<%=uid%>" class="w3-bar-item w3-button" width="120" height="150"/>
      	
    </div>
    <div class="w3-section w3-bottombar w3-padding-16">
    
      <span class="w3-margin-right"><h3>user id: <%=uid %></h3></span> 
        
      <button class="w3-button w3-white">Session ID-<%=session.getId()%></button>
	  
    </div>
    </div>
  </header>
	
	

  <div class="w3-container">
   
    <div class="w3-section w3-bottombar w3-padding-16">
      <button class="w3-button ">
				<a href="recharge.jsp">
  <img src="image/mobilerecharge.png" align="middle" alt="Norway" width="40" height="40"   class="w3-hover-opacity">
      <div >
        <p><b>Mobile Recharge</b></p>
        </div>
      </a>
		</button>
      <button class="w3-button "><i class=" w3-margin-right"></i>
				    <a href="electricbBill.jsp">
    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
  <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.162-.377.413-.687.676-.941A5 5 0 0 0 8 1z"/>
</svg>
      
      <div class="w3-container ">
        <b>EleCtric Bills</b>     
      </div>
      </a>
				
		</button>
		
      <button class="w3-button "><i class="fa fa-photo w3-margin-right">
      		<a href="fastagRecharge.jsp">
  <img src="image/fastag.png" align="middle" alt="Norway" width="40" height="40"   class="w3-hover-opacity">
      <div >
        <p><b>Buy FASTag</b></p>
        </div>
      </a>

      </button>
      <button class="w3-button ">
      	<a href="dthRecharge.jsp">
  <img src="image/DTHrecharge.png" align="middle" alt="Norway" width="40" height="40"   class="w3-hover-opacity">
      <div >
        <p><b>DTH Recharge</b></p>
        </div>
      </a>
      
      </button>
      
        <button class="w3-button "><i class=" w3-margin-right"></i>
				    <a href="addmoney.jsp">
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-wallet2" viewBox="0 0 16 16">
  <path d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499L12.136.326zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484L5.562 3zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z"/>
</svg>
      
      <div >
        <b>Add Money</b>     
      </div>
      </a>
				
		</button>
      
      
    </div>
  </div>
	

	 <br><a href="viewImage.jsp">Show profile</a>
	 <br>
	 	<a href="viewBalance.jsp">balance</a>
	 <br>
     <a href="addmoney.jsp">Add to money</a>
<br>
<a href="CustomerSearchTrans.jsp">Transaction Report</a>
<br>
<a href="CustomerTransMoney.jsp">Transfer Money</a>
<br>
<a href="CustomerPayBills.jsp">Pay Bills</a>


<br><br>
<a href="Logout.jsp">Logout</a>

<br>

        <a href="viewImage.jsp?<%=uid %>">photo here...</a>
              
        <br>
             		<h3>Avalibal Balance</h3>
     		     <div id="manish">
     			
                </div>   
     		<input type="button" value="verify" onclick="makeGetRequest()">
   	
<%
}
else{
	%>
	<h3 style="color:red">Invalid Session</h3>
	<a href="index.jsp">Login Now</a>
	<%
}
%>
</body>
</html>