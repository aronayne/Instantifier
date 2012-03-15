<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
@import url("css/complete.css");
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
		                             		   	"t",
		                             		    "<button id=\"btnDeleteRow\">Delete</button>"]
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
      		                             		 	"t",
      		                             		 "<button id=\"btnDeleteRow\">Delete</button>"]
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

<table cellpadding="0" cellspacing="0" border="0" id="example" class="pretty">
	<thead>
		<tr>
			<th>URI</th>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Date Added</th>
			<th>Remove</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
	<tfoot>
		<tr>
			<th>URI</th>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Date Added</th>
			<th>Remove</th>
		</tr>
	</tfoot>
</table>

</center>


</body>
</html>