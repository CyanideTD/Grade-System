/**
 * 
 */

function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("grades");
	  switching = true;
	  //Set the sorting direction to ascending:
	  dir = "asc"; 
	  /*Make a loop that will continue until
	  no switching has been done:*/
	  while (switching) {
	    //start by saying: no switching is done:
	    switching = false;
	    rows = table.getElementsByTagName("TR");
	    /*Loop through all table rows (except the
	    first, which contains table headers):*/
	    for (i = 1; i < (rows.length - 1); i++) {
	      //start by saying there should be no switching:
	      shouldSwitch = false;
	      /*Get the two elements you want to compare,
	      one from current row and one from the next:*/
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      /*check if the two rows should switch place,
	      based on the direction, asc or desc:*/
	      if (dir == "asc") {
	        if (x.innerHTML > y.innerHTML) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML < y.innerHTML) {
	          //if so, mark as a switch and break the loop:
	          shouldSwitch= true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      /*If a switch has been marked, make the switch
	      and mark that a switch has been done:*/
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      //Each time a switch is done, increase this count by 1:
	      switchcount ++;      
	    } else {
	      /*If no switching has been done AND the direction is "asc",
	      set the direction to "desc" and run the while loop again.*/
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}

function nameFilter() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("name");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("grades");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}

function setLimit(e) {
	var parent = e.parentNode.parentNode.parentNode;
	var content = parent.childNodes[0].innerHTML;
	alert(content);
	document.getElementById("gradeName").setAttribute("value", content);
}




function updateLimit() {
	$.ajax({
		type:"GET",
		url:"jsp.jsp",
		data:$('#limit').serialize(),
		async: false,
		error: function(request) {  
            alert("Connection error:"+request.error);  
        },
        success: function(data) {
        	alert(data);
        }
	});
	return false;
}

function login() {
	$.ajax({
		type:"POST",
		url:"login.jsp",
		data:$('#login').serialize(),
		async:false,
		error:function(request) {
			alert("Connection error:" + request.error);
		},
		success:function(data) {
			var payload = JSON.parse(data);
			if (payload.isValid) {
				$(".overlay").fadeToggle("fast");
				document.getElementById("wrapper").innerHTML="Hello" + payload.username;
			} else {
				alert("Wrong password or username");
			}
		}
	});
	return false;
}

function clickDropDown(i) {
    document.getElementById("myDropdown" + i).classList.toggle("show");
}

