<jsp:useBean id="message" scope="request" type="java.lang.String" />
<html>
<head>
<title>Instantifier</title>

<link rel="stylesheet" type="text/css"
	href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">

<style type="text/css">
@import url("css/style.css");

@import url("css/complete.css");
</style>

<script type="text/javascript" src="js/jquery-1.7.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/jquery.jeditable.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.editable.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/custom-functions.js"></script>
<script type="text/javascript" src="js/jquery.expander.js"></script>
<script type="text/javascript" src="js/jquery.jtruncate.js"></script>

<script type="text/javascript">



  $(document).ready(function() {
  
  	$('#urlDetailsTable').dataTable({
          sPaginationType: "full_numbers",
          
              "bInfo": false,  
              "bFilter": true,
              //change bAutoWidth to true 
              "bAutoWidth": false,
              "iDisplayLength": 300,
              'aoColumns': [null, null, null, null, null, { "sType": "uk_date" }]
      });   	  

/*   	jQuery.fn.dataTableExt.oSort['uk_date-asc']  = function(a,b) {
  		var ukDatea = a.split('/');
  		var ukDateb = b.split('/');
  		
  		var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
  		var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
  		
  		return ((x < y) ? -1 : ((x > y) ?  1 : 0));
  	};

  	jQuery.fn.dataTableExt.oSort['uk_date-desc'] = function(a,b) {
  		var ukDatea = a.split('/');
  		var ukDateb = b.split('/');
  		
  		var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
  		var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
  		
  		return ((x < y) ? 1 : ((x > y) ?  -1 : 0));
  	}; */
  	
  /*  "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
        var $cell=$('td:eq(0)', nRow);
        $cell.text(ellipsis($cell.text(),2));
        return nRow;
}*/
  	
  	//urlDetailsTable_wrapper is the generated id which includes the paging options, just setting the .css on urlDetailsTable will just set the width of the main table 
    $("#urlDetailsTable_wrapper").css("width","80%");
  	
  	var number;
  	
       $.ajax({
          url: 'getallurls',
          data: ({urlVal : $('#urlVal').val()}),
          success: function(data) {
          var jsonObj = jQuery.parseJSON(data);            
          for(var i=0;i<jsonObj.nodes.length;i++){
              var obj = jsonObj.nodes[i];

              var description = obj.url;
              if(description.length > 25){
                  var description = obj.url.substring(obj.url.length-30);
                  description = "... "+description;
              }
			number = i + 1;
      		$('#urlDetailsTable').dataTable().fnAddData( [
      		number,
		"<div id=rowVal"+i+"><a href="+obj.url+" title="+obj.url+">"+obj.url+"</a></div>",
    		                             		    "",
    		                             		   description,
    		                             		    "",
    		                             		 	obj.date]
    		                             		  );     		 
          }

          //truncating the text after it has been added, this is a search can be performed on the entire URL, not just the truncated part
          for(var i=0;i<jsonObj.nodes.length;i++){	  
              var link = $("#rowVal"+i+" a").text();
              if(link.length > 25){
            	  link = link.substring(0 , 25)+" ...";
              }
			$("#rowVal"+i+" a").text(link);
          }
          
          	$('#urlDetailsTable').dataTable().makeEditable({
           		sUpdateURL: "editData"
           		});  
         	
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
			<td><input type="text" id="urlVal"></td>
			<td>
				<button id="addUrlButton" onclick="addUrlAjax()" title="Button">AddUrl</button>
			</td>
		</table>
		<button id="btnDeleteRow" onclick="deleteRow()">Delete</button>
		<table cellpadding="0" cellspacing="0" border="0" id="urlDetailsTable"
			class="pretty">
			<thead>
				<tr>
					<th>#</th>
					<th>URI</th>
					<th>Name</th>
					<th>Description</th>
					<th>Category</th>
					<th>Date Added</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<tr>
				<th>#</th>
					<th>URI</th>
					<th>Name</th>
					<th>Description</th>
					<th>Category</th>
					<th>Date Added</th>
				</tr>
			</tfoot>
		</table>

	</center>

</body>
</html>