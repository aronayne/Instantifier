<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
</style>
  
  <script type="text/javascript" src="js/jquery-1.7.js">
    </script>
  <script type="text/javascript">
    function doAjax() {
      $.ajax({
        url: 'time',
        data: ({name : "me"}),
        success: function(data) {
          $('#time').html(data);
        }
      });
    }

    function addUrlAjax() {
      $('#urlTextboxDiv').html("Please wait");
      $.ajax({
        url: 'addUrl',
        data: ({urlVal : $('#urlVal').val()}),
        success: function(data) {
        //	$("#rounded-corner tr:first").after('<tr><td>'+data+'</td></tr>'');
     	 $('#rounded-corner > tbody:last').prepend('<tr><td>'+data+'</td><td></td><td></td><td></td></tr>');
        }
      });
    }
    
    $(document).ready(function() {
        $.ajax({
            url: 'getallurls',
            data: ({urlVal : $('#urlVal').val()}),
            success: function(data) {
            var jsonObj = jQuery.parseJSON(data);
         	 $('#rounded-corner > tbody:last').prepend('<tr><td>'+jsonObj.name+'</td><td></td><td></td><td></td></tr>');
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

<input type="text" id="urlVal"  >
<button id="addUrlButton" onclick="addUrlAjax()" title="Button">AddUrl</button>

<table id="rounded-corner" summary="2007 Major IT Companies' Profit">

    <thead>

    	<tr>

        	<th scope="col" class="rounded-company">URL</th>

            <th scope="col" class="rounded-q1">Name</th>

            <th scope="col" class="rounded-q2">Description</th>

            <th scope="col" class="rounded-q3">Date Added</th>

        </tr>

    </thead>

        <tfoot>

    	<tr>

        	<td colspan="3" class="rounded-foot-left"><em></em></td>

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

</table>
</center>

</body>
</html>