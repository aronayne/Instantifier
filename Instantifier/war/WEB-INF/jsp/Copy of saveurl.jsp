<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
</style>
  
  <script type="text/javascript" src="js/jquery-1.7.js"></script>
  <script type="text/javascript" src="js/jquery.tablesorter.pager.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
    
  <script type="text/javascript">

    function addUrlAjax() {
    $('#addUrlTable > tbody:last').append('<td id = \'myTD\'><img src=\'/images/ajax-loader.gif\'/></td>');

      $.ajax({
        url: 'addUrl',
        data: ({urlVal : $('#urlVal').val()}),
        success: function(data) {
        //	$("#rounded-corner tr:first").after('<tr><td>'+data+'</td></tr>'');
     	 $('#myTable > tbody:last').prepend('<tr><td>'+data+'</td><td></td><td></td><td></td><td></td></tr>').trigger("update");
     	$('#myTD').remove();
        $("#myTable").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: $("#pager")}); 
        }
      });
    }
    
    /*
   	Calls spring controllers and outputs all URL's
    */
    $(document).ready(function() {

    		    { 
                    $("#myTable").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: $("#pager")}); 
                    $("#pager").css('top','100px','auto');  
    		    } 

         $.ajax({
            url: 'getallurls',
            data: ({urlVal : $('#urlVal').val()}),
            success: function(data) {
            var jsonObj = jQuery.parseJSON(data);            
            for(var i=0;i<jsonObj.nodes.length;i++){
                var obj = jsonObj.nodes[i];
                $('#myTable > tbody:last').prepend('<tr><td>'+obj.url+'</td><td></td><td></td><td></td><td></td></tr>');
            }
            }
          });
    	});
    
  </script>
</head>
<body>
${message}

<!--  
<button id="demo" onclick="doAjax()" title="Button">Get the time!</button>
<div id="time">
</div>
-->
<center>

<table id="addUrlTable">
<td>
<input type="text" id="urlVal"  >
</td>
<td>
<button id="addUrlButton" onclick="addUrlAjax()" title="Button">AddUrl</button>
</td>
</table>

<table id="myTable" class="tablesorter"> 
<thead> 
<tr> 
    <th>Last Name</th> 
    <th>First Name</th> 
    <th>Email</th> 
    <th>Due</th> 
    <th>Web Site</th> 
</tr> 
</thead> 
<tbody> 

</tbody> 
</table> 
<table>
<div id="pager" class="pager">

	<form>

		<img src="/images/first.png" class="first"/>

		<img src="/images/prev.png" class="prev"/>

		<input type="text" class="pagedisplay"/>

		<img src="/images/next.png" class="next"/>

		<img src="/images/last.png" class="last"/>

		<select class="pagesize">

			<option selected="selected"  value="10">10</option>

			<option value="20">20</option>

			<option value="30">30</option>

			<option  value="40">40</option>

		</select>

	</form>

</div>
</table>

<img src="/images/filter.jpeg"/>
<img src="/images/add.jpeg"/>
</center>


</body>
</html>