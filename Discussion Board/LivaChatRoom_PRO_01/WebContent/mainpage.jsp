<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Discussion Board for beating CANVAS</title>

    <!-- Bootstrap core CSS -->
    <!--<link href="CSS/bootstrap.min.css" rel="stylesheet">-->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="CSS/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="CSS/offcanvas.css" rel="stylesheet">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<link rel="stylesheet" href="dis_mainP.css">
  	  	
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="CSS/ie-emulation-modes-warning.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--<script src="js/jquery.min.js"></script>*/
    <script src="js/bootstrap.min.js"></script><!-->  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    // at beginning we run following code, the page will get data from remote json file
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var dis_num = 0;
            myObj = JSON.parse(this.responseText);
           	dis_num = myObj.discussion.dis_num;
            if(dis_num != 0){
            	document.getElementById("demo").innerHTML = myObj.discussion.dis_num;
          	var i="dis-third";
            document.getElementById("dis-first").innerHTML = myObj.discussion.dis_list[0].topic;
            document.getElementById("dis-second").innerHTML = myObj.discussion.dis_list[1].topic;
            document.getElementById("dis-second").href=myObj.discussion.dis_list[1].link;
            document.getElementById(i).innerHTML = myObj.discussion.dis_list[2].topic;
            }
        	document.getElementById("demo").innerHTML = myObj.discussion.dis_num;
            
        }
    };
    xmlhttp.open("GET", "", true);
    xmlhttp.send();
    
    function pro_tp_create() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function(){
            var dis_num = 0;
            var dis_href;
            var dis_tp_name;
            var tab = document.getElementById("pro_tab");
            var pro_tag_a;
            var node;
            if (this.readyState == 4 && this.status == 200) {

                myObj = JSON.parse(this.responseText);
               	dis_num = myObj.discussion.dis_num;
               	for(i=0;i<dis_num;i++){
               		dis_href = myObj.discussion.dis_list[i].link;
               		dis_tp_name = myObj.discussion.dis_list[i].topic;
               	
            		pro_tag_a = document.createElement("a");
            		node = document.createTextNode(dis_tp_name);
            		pro_tag_a.appendChild(node);
            		pro_tag_a.setAttribute("href", dis_href);
            		if(i%2 != 0){
                		pro_tag_a.setAttribute("class", "list-group-item");      			
            		}else{
                		pro_tag_a.setAttribute("class", "list-group-item active");           			
            		}
            		tab.appendChild(pro_tag_a);
            	}
               	
            }

        };
        
            xmlhttp.open("GET", "", true);
            xmlhttp.send();

        }
	function list_stu_create(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function(){
        	var stu_num =0;
        	var icon_src;
        	var stu_name;
        	var stu_status;
        	
        	

        }
		
	}

    function clickButton() {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
              myObj = JSON.parse(this.responseText);
              document.getElementById("demo").innerHTML = myObj.results[0].address_components[0].long_name;
          }
      };
      xmlhttp.open("GET", "http://maps.googleapis.com/maps/api/geocode/json?address=Hoboken", true);
      xmlhttp.send();
    }

    </script>
    <script>

        /* show or hide pop up login window */
        function login_show(tag){

          var light=document.getElementById(tag);
          var fade=document.getElementById('fade1');
          var fade=document.getElementById('fade2');
          light.style.display='block';
          fade1.style.display='block';
          fade2.style.display='block';
        }

        function login_hide(tag){
          var light=document.getElementById(tag);
          var fade=document.getElementById('fade1');
          var fade=document.getElementById('fade2');
          light.style.display='none';
          fade1.style.display='none';
          fade2.style.display='none';
            //  location.reload();

        }
        function logout_show(tag){

            var light=document.getElementById(tag);
            var fade=document.getElementById('fade1');
            var fade=document.getElementById('fade2');
            light.style.display='block';
            fade1.style.display='block';
            fade2.style.display='block';

            

          }

    </script>
    <style>
         /* style for list of student */
        .stu_icon {
        	width: 10%;
        	height: 2.9%;
        	float:left;
        }
    
    </style>

  </head>

  <body>
          <div id="fade1" class="black_overlay"></div>
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div id="fade2" class="black_overlay"></div>
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">CPE640</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li class="dropdown">
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Discussion <span class="caret"></span></a>
                 <ul class="dropdown-menu">
                   <li><a href="#">Create Discussion</a></li>
                 </ul>
               </li>

               <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Project <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Create Project</a></li>
                    </ul>
                  </li>
          </ul>


          <ul class="nav navbar-nav navbar-right">
             <%
            	String username;
        		username = (String)session.getAttribute("username");
        		if(username != null){
        			%>
        			<li><a href="javascript:void(0)" onclick="logout_show('win_logout')">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
        			<% 

        		}else{
        			%>
					<li><a href="javascript:void(0)" onclick="login_show('win_login')"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			<% }%>
              
              
              

          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

      <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>

      <div class="panel panel-default">
      <div class="panel-heading" style="padding:10px 10px">
        <span class="navbar-right" style="padding:0px 10px"><span style="padding:0px 5px"><input onclick="login_show('bb_post')" type="submit" class="btn btn-xs btn-info" value="Post"></span><button id="billboard_collapse" type="button" class="btn btn-xs btn-info btn-coll" data-toggle="collapse" data-target="#collapse1"></button></span>
        <h4 class="panel-title">
          Bill Board
        </h4>

      </div>

      <div id="collapse1" class="panel-collapse collapse in">
        <div style="padding: 45px" class="panel-body"><p id="demo">(Notice there is limitation for how many character you can enter)</p></div>
      </div>
      </div>

      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#discussion">Discussion</a></li>
        <li><a data-toggle="tab" href="#project">Project</a></li>
      </ul>
      <div class="tab-content">
        <div id="discussion" class="tab-pane fade in active">
            <div class="list-group">
                <a id="dis-first" href="" class="list-group-item active">First item</a>
                <a id="dis-second" href="" class="list-group-item">Second item</a>
                <a id="dis-third" href="" class="list-group-item active">Third item</a>
            </div>
          </div>
        <div id="project" class="tab-pane fade">
          <div id="pro_tab" class="list-group">
          	<script>
          		pro_tp_create();
          	</script>
          </div>
        </div>

        </div>
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div id="list-stu" class="list-group">
            <a href="#" class="list-group-item active"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>

            <%
        		if(username != null){
        			%>
        			&#9819
        			<% 
        			out.print(username);
        		}else{
        			%>
        			&#9822
					Link
			<% }%>
           </a>
            
            
            
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
            <a href="#" class="list-group-item"><img alt="ok" class="stu_icon" src="icon/usr_icon/Ph03nyx-Super-Mario-Lakitu.ico"></img>&#9822Link</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; 2017 Discussion team present, Stevens Institute Of Techology.</p>
      </footer>

    </div><!--/.container-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="offcanvas.js"></script>
    <!-- pop up log in window -->
    <div id="win_login" class="white_content">
        <button type="button" class="btn btn-xs btn-danger btn-right" onclick="login_hide('win_login')">Close</button>
        <p><b>Log in</b></p>
        <div class="win_login_center">
          <form action="LoginServlet" method="post">
            Username:<br>
            <input type="text" name="Username">
            <br>
            Password:<br>
            <input type="password" name="Password">
            <br><br>
            <input type="submit" class="btn btn-xs btn-info" value="Submit" onclick="login_hide('win_login')">
          </form>
        </div>
    </div>
    
    <div id="win_logout" class="white_content">
        <button type="button" class="btn btn-xs btn-danger btn-right" onclick="login_hide('win_logout')">Close</button>
        <p><b>Are you sure?</b></p>
        <div class="win_login_center">
        	<form action="" method="get"> 
            	<input type="submit" class="btn btn-xs btn-danger" value="Yes">
            	<input type="button" class="btn btn-xs btn-info btn-right" value="No" onclick="login_hide('win_logout')">
        	</form>

        </div>
    </div>
    
    <!-- pop up bill board post window -->
    <div id="bb_post" class="white_content2">
        <button type="button" class="btn btn-xs btn-danger btn-right" onclick="login_hide('bb_post')">Close</button>
        <p><b>POST</b></p>
        <div class="win_login_center">
          <form action="">
            <b>Topic</b>&#32;<input style="border: 2px solid #9ACD32" type="text" size="74" name="Topic">
            <br>
            <br>
            <textarea style="border: 1.5px solid #FF7F50" name="billboard" rows="10" cols="83">add something...</textarea>
            <br><br>
            <input type="submit" class="btn btn-sm btn-info" onclick="clickButton();login_hide('bb_post')" value="Sumbit">
          </form>
        </div>
    </div>

</body>
</html>