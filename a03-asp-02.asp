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

  <body>
    <%
      dim userName
      dim maxNum
      dim randomNum

      userName=Request.Cookies("userName")
      maxNum=Request.Form("maxNum")
      randomNum=Request.Cookies("randomNum")

      ' If page successfully gets the maxNum, create the maxNum cookie 
      if(maxNum <> "") then
        Response.Cookies("maxNum") = maxNum
      end if

      if(randomNum = "") then
        Randomize
        randomNum = Int((maxNum*Rnd) + 1)

        if(randomNum <> "") then
          Response.Cookies("randomNum") = randomNum
        end if

      end if
    %>


    <form action="a03-asp-02.asp" method="post" name="GameStartForm">
      <div id="section3">
        <h1>Hey <%=userName%> Guess the your number!</h1>
        <input  id="guessNum"  type="number" class="guess-num" placeholder="Guess the number"></input>
        <button class="guess-submit" onclick="checkAnswer()">Make This Guess</button>
        <div    id="guessError" class="guess-error"  style="color:red;"></div>
        <p      id = "hint"></p>
      </div>
    </form>

  </body>
</html>