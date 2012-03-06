<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
</style>
  
  <script type="text/javascript" src="js/jquery-1.7.js"></script>
  <script type="text/javascript" src="js/jquery.dataTables.js"></script>
    
  <script type="text/javascript">

    function addUrlAjax() {
    $('#addUrlTable > tbody:last').append('<td id = \'myTD\'><img src=\'/images/ajax-loader.gif\'/></td>');

      $.ajax({
        url: 'addUrl',
        data: ({urlVal : $('#urlVal').val()}),
        success: function(data) {
     	$('#myTD').remove();

		$('#example').dataTable().fnAddData( [
		                             		    data,
		                             		    "t",
		                             		    "t",
		                             		    "t",
		                             		    "t"]
		                             		  );   
		  
        }
      });
    }
    
    /*
   	Calls spring controllers and outputs all URL's
    */
    $(document).ready(function() {

    		    {             
                    $('#example').dataTable( {
            			"sPaginationType": "full_numbers"
            		} );                 
    		    } 

         $.ajax({
            url: 'getallurls',
            data: ({urlVal : $('#urlVal').val()}),
            success: function(data) {
            var jsonObj = jQuery.parseJSON(data);            
            for(var i=0;i<jsonObj.nodes.length;i++){
                var obj = jsonObj.nodes[i];
        		$('#example').dataTable().fnAddData( [
      		                             		    obj.url,
      		                             		    "t",
      		                             		    "t",
      		                             		    "t",
      		                             		    "t"]
      		                             		  );   
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

<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			<th>Platform(s)</th>
			<th>Engine version</th>
			<th>CSS grade</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
	<tfoot>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			<th>Platform(s)</th>
			<th>Engine version</th>
			<th>CSS grade</th>
		</tr>
	</tfoot>
</table>

</center>


</body>
</html>