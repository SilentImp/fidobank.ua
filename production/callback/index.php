<?php 
  if(
    isset($_POST['person'])
    &&isset($_POST['phone'])
    &&isset($_POST['term'])
    &&isset($_POST['name'])
    &&isset($_POST['summ'])
    &&isset($_POST['currency'])
  ){

    // Переменные надо хоть как то чистить, блин.
    foreach ($_POST as $key => $value){
        $_POST[$key] = htmlspecialchars($_POST[$key]);
    }

    mail(
    'ann.gant@gmail.com, andrii@sus.name', 
    'Заявка на д'.substr($_POST['name'],1), 
    'Заявка от '.$_POST['person'].'. \nНомер телефона '.$_POST['phone'].'. \n '.$_POST['name'].'. \nБажаний строк депозиту: '.$_POST['term'].'. \nCумма депозиту: '.$_POST['summ'].'. \nВалюта депозиту: '.$_POST['currency']);
}?>
<!-- 
<!DOCTYPE html><html lang="ru"><head>
<meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="author" content="Anton Nemtsev, @silentimp, skype: ravencry"><link rel="stylesheet" href="css/styles.css"><script src="js/requirejs/require.js" data-main="js/fidobank.js"></script><title>Депозит Єдність від Фідобанк</title></head><body><body><header><div class="wrapper"><h1 class="logotype">FidoBank</h1><section class="contacts"><h2 class="title"></h2><a href="tel:+380442388835">044 238 88 35<span>Дзвінки за стандартними тарифами оператора</span></a></section></div></header>

<section class="deposit deposit-unity">
        <br><br><br><br>
            <div class="wrapper">
                <h2 class="title">Дякуємо, заявку прийнято в роботу. Контакт-центр ФІДОБАНКу зв'яжеться з тобою протягом 20 хвилин для уточнення деталей</h2>
            </div>
</section>
 
<footer><p>ПуАТ «ФІДОБАНК». Банківські послуги. </p><p>Ліцензія НБУ № 4 від 13.07.2012 р. </p><p>Генеральна ліцензія НБУ № 4-3 від 28.10.2013 р.</p></footer></body></html>

 -->
