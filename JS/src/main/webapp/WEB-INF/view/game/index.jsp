<!DOCTYPE html>
<html>
    <head>
        <title>HTML5 Tetris</title>
        <link rel='stylesheet' href='<%=request.getContextPath()%>/resources/game/style.css' />
    </head>
    <body>
        <audio id="clearsound" src="sound/pop.ogg" preload="auto"></audio>
        <canvas width='300' height='600'></canvas>
        <button id="playbutton" onclick="playButtonClicked();">Play</button>
        <script src='<%=request.getContextPath()%>/resources/game/js/tetris.js'></script>
        <script src='<%=request.getContextPath()%>/resources/game/js/controller.js'></script>
        <script src='<%=request.getContextPath()%>/resources/game/js/render.js'></script>
    </body>
</html>