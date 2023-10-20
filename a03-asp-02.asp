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

      randomNum=Request.Cookies("randomNum")
      lowHintRange=Request.Cookies("lowHintRange")
      highHintRange= Request.Cookies("highHintRange")

      guessNum=Request.Form("guessNum")

      Response.Write(randomNum)
      Response.Write(maxNum)
      Response.Write(guessNum)


      ' If page successfully gets the maxNum, create the maxNum cookie 
      ' Every resubmition, reassign the maxNum using 'maxnum' cookie
      if(maxNum <> "") then
        Response.Cookies("maxNum") = maxNum
      else
        maxNum=Request.Cookies("maxNum")
      end if


      ' (initialize) If radom number is not generated, create random number and make its cookie
      if(randomNum = "") then
        Randomize
        randomNum = Int((maxNum*Rnd) + 1)

        if(randomNum <> "") then
          Response.Cookies("randomNum") = randomNum
        end if

      end if


      ' (initialize) If low hint range is blank, set lowHintRange as 1 and make its cookie 
      if(lowHintRange = "") then
        lowHintRange = 1

        if(lowHintRange <> "") then
          Response.Cookies("lowHintRange") = lowHintRange
        end if

      end if


      ' (initialize) If high hint range is blank, set highHintRange as 1 and make its cookie 
      if(highHintRange = "") then
        highHintRange = maxNum 

        if(highHintRange <> "") then
          Response.Cookies("highHintRange") = highHintRange
        end if

      end if


      if ( (guessNum < maxNum) and (guessNum > 1) ) then

        if (guessNum < randomNum) then
          lowHintRange = guessNum + 1
        elseif (guessNum > randomNum) then
          highHintRange = guessNum - 1
        elseif (guessNum = randomNum) then
          Set form = document.getElementById("GameWin")
          form.submit()
        end if
      else
        Response.Write(" Out of range")
      end if

    %>


    <form action="a03-asp-02.asp" method="post" name="GameStartForm">
      <div id="section3">
        <h1>Hey <%=userName%> Guess the your number!</h1>
        <input  id="guessNum" name="guessNum"  type="number" class="guess-num" placeholder="Guess the number"></input>
        <input  type="button" class="guess-submit" onclick="numValidate()" value="Make This Guess" /> 
        <p id = "hint"> Your allowable guessing range is any value between <%=lowHintRange%> and <%=highHintRange%> </p>
        <div    id="guessError" class="guess-error" style="color:red;"></div>
      </div>
    </form>

    <form action="a03-asp-03.asp" name="GameWin" id="GameWin"/>

  </body>
</html>