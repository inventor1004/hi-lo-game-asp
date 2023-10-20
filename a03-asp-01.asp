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
          // generate the random number which has a maximum random number gets from the user
          let randomNum = Math.trunc(Math.random() * maxNumber) + 1;
          console.log(`Random Number is ${randomNum}.`);
        }
      }
    }
  </script>

  <body id="body">
    <!-- ASP Script -->
    <%
      dim name

      name=Request.Form("name")

      if(name <> "") then
        Response.Cookies(name) = Name
      end if
    %>

    <!-- HTML -->
    <h1> Hi <%=name%>! Please enter the maximum number you want! </h1>
    <input  id="maxNum"  type="number" class="max-num" placeholder="Enter the maximum number"></input>
    <input type="button" class="range-submit" onclick="numValidate()">Submit</input>
    <div    id="rangeError" class = "range-error"  style="color:red;"></div>
  </body>e
</html>