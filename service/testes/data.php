<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
    </head>
    <body>

        <?php 
        echo strftime('%A, %d de %B de %Y', strtotime('today'));
        echo "<br>";
        setlocale(LC_TIME, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
        date_default_timezone_set('UTC');
        echo strftime('%A, %d de %B de %Y', strtotime('today'));
        ?>
    </body>
</html>