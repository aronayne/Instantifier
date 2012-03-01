<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
</style>
  
  <script type="text/javascript" src="js/jquery-1.7.js"></script>
    <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
    
  <script type="text/javascript">

    function addUrlAjax() {
    $('#addUrlTable > tbody:last').append('<td id = \'myTD\'><img src=\'/images/ajax-loader.gif\'/></td>');

      $.ajax({
        url: 'addUrl',
        data: ({urlVal : $('#urlVal').val()}),
        success: function(data) {
        //	$("#rounded-corner tr:first").after('<tr><td>'+data+'</td></tr>'');
     	 $('#rounded-corner > tbody:last').prepend('<tr><td>'+data+'</td><td></td><td></td><td></td><td></td></tr>');
     	$('#myTD').remove();
        }
      });
    }
    
    /*
   	Calls spring controllers and outputs all URL's
    */
    $(document).ready(function() {

    		    { 
                    $("#myTable").tablesorter(); 
    		    } 

         $.ajax({
            url: 'getallurls',
            data: ({urlVal : $('#urlVal').val()}),
            success: function(data) {
            var jsonObj = jQuery.parseJSON(data);            
            for(var i=0;i<jsonObj.nodes.length;i++){
                var obj = jsonObj.nodes[i];
                $('#myTable > tbody:last').prepend('<tr><td>'+obj.url+'</td><td></td><td></td><td></td><td></td></tr>');
               // $('#rounded-corner > tbody:last').prepend('<tr><td>'+obj.url+'</td><td></td><td></td><td></td><td></td></tr>');
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

<table id="rounded-corner" summary="2007 Major IT Companies' Profit">

    <thead>

    	<tr>

        	<th scope="col" class="rounded-company">URL</th>

            <th scope="col" class="rounded-q1">Name</th>

            <th scope="col" class="rounded-q2">Description</th>
            
             <th scope="col" class="rounded-q2">Category</th>

            <th scope="col" class="rounded-q3">Date Added</th>

        </tr>

    </thead>

        <tfoot>

    	<tr>

        	<td colspan="4" class="rounded-foot-left"><em></em></td>

        	<td class="rounded-foot-right">&nbsp;</td>

        </tr>

    </tfoot>

    <tbody>

<!-- 
        <tr>

        	<td>IBM</td>

            <td>20.4</td>

            <td>15.6</td>

            <td>22.3</td>

            <td>29.3</td>

        </tr>
 -->
 
    </tbody>

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
<tr> 
    <td>Smith</td> 
    <td>John</td> 
    <td>jsmith@gmail.com</td> 
    <td>$50.00</td> 
    <td>http://www.jsmith.com</td> 
</tr> 
<tr> 
    <td>Bach</td> 
    <td>Frank</td> 
    <td>fbach@yahoo.com</td> 
    <td>$50.00</td> 
    <td>http://www.frank.com</td> 
</tr> 
<tr> 
    <td>Doe</td> 
    <td>Jason</td> 
    <td>jdoe@hotmail.com</td> 
    <td>$100.00</td> 
    <td>http://www.jdoe.com</td> 
</tr> 
<tr> 
    <td>Conway</td> 
    <td>Tim</td> 
    <td>tconway@earthlink.net</td> 
    <td>$50.00</td> 
    <td>http://www.timconway.com</td> 
</tr> 
</tbody> 
</table> 

<img src="/images/filter.jpeg"/>
<img src="/images/add.jpeg"/>
</center>


</body>
</html>