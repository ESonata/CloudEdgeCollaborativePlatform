function CheckLogin()
{
		var username=document.getElementById("user").value;
	    var password=document.getElementById("pass").value;
	    var checkcode=document.getElementById("checkcode").value;
	    $.post(
	        "/Semester_Demo/AdminLogin.do",
	        {"username":username,"password":password,"checkcode":checkcode},
	        function(data)
	        {
	           	if(data.msg=="success")
	        	   {
	           		
	           		window.location.href="/Semester_Demo/admin/index.jsp";
	        	   }
	           	else
	           	{
	           		alert(data.msg+"请重试");
	           		location.reload();
	           	}
	        },
	        "json"
	    );
	
}