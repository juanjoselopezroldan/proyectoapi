%include('header.tpl')
    <title>.::Twitter::.</title>
  </head>
  <body>
    <h2>Comparte con tus seguidores tus lugares favoritos o en los que has estado:</h2>
    <br />
    <form action="/twittear" method="post">
      <p><textarea name="tweet" id="textbox" rows="3" cols="50" maxlength="140">
        Me ha gustado este lugar: {{url}}
      </textarea></p>
      <p><input type="submit" class="button" value="Enviar" /></p>
    </form>
 </body>
%include('footer.tpl')
