<!DOCTYPE html>
<!--
 * File Name  : a03-asp-01.asp
 * By	   	    : Honggyu(Chris) Park
 * Date	   	  : 10/21/2023
 * Description:
-->
<html>
  <head>
    <head>
      <title> HI-LO GAME </title> 
    </head>
  </head>

  <script type="text/javascript">
    
  </script>
  
  <body>
    <%
      'Initialize all cookies for the new game'
      dim userName
      dim maxNum
      dim randomNum
      dim lowHintRange
      dim highHintRange
      dim guessNum

      userName     = Request.Cookies("randomNum")
      maxNum       = Request.Cookies("maxNum")
      randomNum    = Request.Cookies("randomNum")
      lowHintRange = Request.Cookies("lowHintRange")
      highHintRange= Request.Cookies("highHintRange")
      guessNum     = Request.Cookies("guessNum")

    %>

    <form action="a03.html" method="post" name="CelebrationPage"> 
      <button class="play-again" onclick="RestartGame()">Wanna Play Again?</button>
    </form>
  </body>
</html>