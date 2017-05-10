%include('header.tpl')
    <h2>Comparte el lugar en el que has estado o tus lugares favoritos con tus seguidores:</h2>
    <br />

    <form action="/twittear" method="post">
      <p><textarea name="tweet" id="textbox" rows="3" cols="50" maxlength="140">
        Me ha gustado este lugar: {{url}}
      </textarea></p>
      <p><input type="submit" class="button" value="Enviar" /><img src="static/style/0.png" width="50" height="45" alt="" align="rigth" /></p>
    </form>
%include('footer.tpl')