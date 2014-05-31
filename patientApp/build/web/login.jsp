<%-- 
    Document   : login
    Created on : May 27, 2014, 4:44:38 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
		$("#login_frm").submit(function(){

			 //remove previous class and add new "myinfo" class
	        $("#msgbox").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);

			
			this.timer = setTimeout(function () {
				$.ajax({
		          	url: 'LoginServlet',
		          	data: 'user='+ $('#login_id').val() +'&password=' + $('#password').val(),
		          	type: 'post',
		   			success: function(msg){
						if(msg == 'True') // Message Sent, check and redirect
						{				// and direct to the success page
							
							$("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,
			                  function()
			                  {
			                     //redirect to secure page
			                     document.location='Index';
			                  });
	
						}
						else
						{
							$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
		                	{
			                  //add message and change the class of the box and start fading
			                  $(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);
			                });
	
						}
					}
				
				});
			}, 200);
			return false;
 		});		

	});
        </script>

    </head>
    <body>
       <form name="login_frm" id="login_frm" action="" method="post">
    <div id="login_box">
      <div id="login_header">
            Fiona TCM Patient App Login
      </div>
      <div id="form_val">
        <div class="label">User Id :</div>
        <div class="control"><input type="text" name="login_id" id="login_id"/><span style="font-size: 10px;"></span></div>
        
        <div class="label">Password:</div>
        <div class="control"><input type="password" name="password" id="password"/><span style="font-size: 10px;"></span></div>
        <div style="clear:both;height:0px;"></div>
      
      	<div id="msgbox"></div>
      </div>
      <div id="login_footer">
        <label>
        <input type="submit" name="login" id="login" value="Login" class="btnClass" />
        </label>
      </div>
    </div>
</form>
    </body>
</html>
