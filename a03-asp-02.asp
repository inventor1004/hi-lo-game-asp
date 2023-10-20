<!DOCTYPE html>
<!--
 * File Name  : a03-asp-02.asp
 * By	   	    : Honggyu(Chris) Park
 * Date	   	  : 10/21/2023
 * Description: 
-->

<html>
  <head>
    <title> HI-LO GAME </title> 
  </head>

  <script type="text/javascript">
    /* Function name: numValidate()                                                                */
    /* Discription  : This function gets checks the maximum number validation and prompt the error */
    /*               messages.                                                            */
    /*               - Error Lists: 1.blank error  2.Decinal number error                          */
    /* Parameter    : void                                                                         */
    /* Return Value : void                                                                         */
    function numValidate()
    {
      maxNumber = document.getElementById("guessNum").value;
      let decimalCheck = (maxNumber % 1 == 0);
     
      if (maxNumber == "")
      {
        document.getElementById("guessError").innerHTML = "You <b>cannot</b> enter BLANK.";
      }
      else if(decimalCheck == false)
      {
        document.getElementById("guessError").innerHTML = "You <b>cannot</b> enter the decimal number.";
      }
      else
      {
        document.GameStartForm.submit();
      }
    }
  </script>

  <body>
    <%
      dim userName
      dim maxNum
      dim randomNum
      dim lowHintRange
      dim highHintRange
      dim guessNum

      userName=Request.Cookies("userName")
      maxNum=Request.Form("maxNum")

      randomNum=CInt(Request.Cookies("randomNum"))
      lowHintRange=CInt(Request.Cookies("lowHintRange"))
      highHintRange=CInt(Request.Cookies("highHintRange"))

      guessNum=CInt(Request.Form("guessNum"))      


      ' If page successfully gets the maxNum, create the maxNum cookie 
      ' Every resubmition, reassign the maxNum using 'maxnum' cookie
      
      if(maxNum <> "") then
        Response.Cookies("maxNum") = maxNum
        ' (initialize) If radom number is not generated, create random number and make its cookie
        Randomize
        randomNum = Int((maxNum*Rnd) + 1)
        if(randomNum <> "") then
          Response.Cookies("randomNum") = randomNum
        end if
        ' (initialize) If low hint range is blank, set lowHintRange as 1 and make its cookie 
        lowHintRange = 1
        if(lowHintRange <> "") then
          Response.Cookies("lowHintRange") = lowHintRange
        end if
        ' (initialize) If high hint range is blank, set highHintRange as 1 and make its cookie 
        highHintRange = maxNum 
        if(highHintRange <> "") then
          Response.Cookies("highHintRange") = highHintRange
        end if
      else
        maxNum=CInt(Request.Cookies("maxNum"))
      end if
      

    %>


    <form action="a03-asp-02.asp" method="post" name="GameStartForm">
      <div id="section3">
        <h1>Hey <%=userName%> Guess the your number!</h1>
        <input  id="guessNum" name="guessNum"  type="number" class="guess-num" placeholder="Guess the number"></input>
        <input  type="button" class="guess-submit" onclick="numValidate()" value="Make This Guess" /> 

        <%
        Response.Write("<p> guessNum : " & guessNum & "</p>")
        Response.Write("<p> maxNum   : " & maxNum & "</p>")
        Response.Write("<p> randomNum: " & randomNum & "</p>")
        Response.Write("<p> lowHintRange : " & lowHintRange & "</p>")
        Response.Write("<p> highHintRange: " & highHintRange & "</p>")
        

        if ( (guessNum < maxNum) and (guessNum > 1) ) then

          if ( (guessNum < randomNum) and (guessNum >= lowHintRange) ) then
            lowHintRange = guessNum + 1
            Response.Cookies("lowHintRange") = lowHintRange

          elseif ( (guessNum > randomNum) and (guessNum <= highHintRange) ) then
            highHintRange = guessNum - 1
            Response.Cookies("highHintRange") = highHintRange

          elseif (guessNum = randomNum) then
            Set form = document.getElementById("GameWin")
            form.submit()
          end if

        else
          Response.Write(" <div style=""color:red;""> Out of range </div>")
        end if
        %>
        <p id = "hint"> Your allowable guessing range is any value between <%=lowHintRange%> and <%=highHintRange%> </p>
        <div id="guessError" class="guess-error" style="color:red;"></div>

      </div>
    </form>

    <form action="a03-asp-03.asp" name="GameWin" id="GameWin"/>

  </body>
</html>