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
  
  	var oTable = $('#urlDetailsTable').dataTable({
          sPaginationType: "full_numbers",
          
              "bInfo": false,  
              "bFilter": true,
              //change bAutoWidth to true 
              "bAutoWidth": false
      }).makeEditable({
          sDeleteURL: "deleterow"
      });    	  

	
  /*  "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
        var $cell=$('td:eq(0)', nRow);
        $cell.text(ellipsis($cell.text(),2));
        return nRow;
}*/
  	
  	//urlDetailsTable_wrapper is the generated id which includes the paging options, just setting the .css on urlDetailsTable will just set the width of the main table 
    $("#urlDetailsTable_wrapper").css("width","80%");
  	
       $.ajax({
          url: 'getallurls',
          data: ({urlVal : $('#urlVal').val()}),
          success: function(data) {
        	  

        	  
          var jsonObj = jQuery.parseJSON(data);            
          for(var i=0;i<jsonObj.nodes.length;i++){
              var obj = jsonObj.nodes[i];
              
              var link = obj.url;
              if(link.length > 20){
            	  link = obj.url.substring(0 , 20);
              }

              var description = obj.url.substring(obj.url.substring.length-10 , obj.url.substring.length);
      		$('#urlDetailsTable').dataTable().fnAddData( [
      		
	"<div id=dsd"+i+"><a href="+obj.url+" title="+obj.url+">"+link+"</a></div>",
    		                             		    "",
    		                             		   description,
    		                             		    "",
    		                             		 	obj.date]
    		                             		  );  
      		
/*            $("#dsd"+i).expander({
           	  slicePoint: 2,
           	  widow: 2,
           	  expandEffect: 'show',
           	  userCollapseText: '[^]'
           	});  */
            
      /*		 $("#dsd"+i).jTruncate({  
      	        length: 2,  
      	        minTrail: 0,  
      	        moreText: "[see all]",  
      	        lessText: "[hide extra]",  
      	        ellipsisText: " (truncated)",  
      	        moreAni: "fast",  
      	        lessAni: 20  
      	    });  */
      		 
          }

          for(var i=0;i<jsonObj.nodes.length;i++){
        // $("#dsd"+i).each(function(){

        	  //  if("#dsd"+i).text().length > 10){
        	               //alert($(this).html());
        	               //($"#dsd"+i).html.text().substring(0 , 10);
        	 //      }

       // 	});​
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