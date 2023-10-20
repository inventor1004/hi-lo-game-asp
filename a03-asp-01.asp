<!DOCTYPE html>
<!--
 * File Name  : a03-asp-01.asp
 * By	   	    : Honggyu(Chris) Park
 * Date	   	  : 10/21/2023
 * Description: This file is the second page of the asp version of the hi-lo game page
               It gets a maximum number that is used for guessing game from a game player.
               the maximum number input will be validated whether it is greater than 1
-->

<html>
  <head>
    <title> HI-LO GAME </title> 
  </head>

  <script type="text/javascript">
     function numValidate()
    {
      let maxNumber = document.getElementById("maxNum").value;
      let decimalCheck = (maxNumber % 1 == 0);
     
      if (maxNumber == "")
      {
        document.getElementById("rangeError").innerHTML = "You <b>cannot</b> enter BLANK.";
      }
      else if(decimalCheck == false)
      {
        document.getElementById("rangeError").innerHTML = "You <b>cannot</b> enter the decimal number.";
      }
      else
      {
        // type cast string to number and store that value to the highHintRange
        // which will be used to give some range hint to the user
        maxNumber = Number(maxNumber);
        if(maxNumber <= 0)
        {
          document.getElementById("rangeError").innerHTML = "Please enter the number greater than 0.";
        }
        else
        {
          document.InitialMaxNumForm.submit();
        }
      }
    }
  </script>

  <body id="body">
    <!-- ASP Script -->
    <%
      dim userName
      dim maxNum

      userName=Request.Form("userName")

      if(userName <> "") then
        if(maxNum = "") then
          maxNum=Request.Form("initalMaxNum")
          Response.Write(maxNum)
        else
          maxNum=Request.Form("newMaxNum")
          Response.Write(maxNum)
          
      end if
    %>

    <% if (maxNum = "") then %>
      <form action="a03-asp-01.asp" method="post" name="InitialMaxNumForm">
        <h1> Hi <%=userName%>! Please enter the maximum number you want! </h1>
        <input id="maxNum" name="initalMaxNum"  type="number" class="max-num" placeholder="Enter the maximum number"/>
        <input type="button" class="range-submit" onclick="numValidate()" value="Submit"/>
      </form>
    <% elseif (maxNum < 1) then %>
      <form actuion="a03-asp-01.asp" method="post" name="InvalidMaxNumForm">
        <h1> Hi <%=userName%>! Please enter the maximum number you want! </h1>
        <input id="maxNum" name="newMaxNum"  type="number" class="max-num" placeholder="Enter the maximum number"/>
        <input type="button" class="range-submit" onclick="numValidate()" value="Submit"/>
        <div   id="rangeError" class = "range-error"  style="color:red;"></div>
      </form>
    <% else %>

    <% end if %>
    
      
    
  </body>
</html>