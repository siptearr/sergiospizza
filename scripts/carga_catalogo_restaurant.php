<?php
    $rutatemplate = $_POST["rutatemplate"];

echo '<a href="#" rel="toggle[cocina]" data-openimage="'.$rutatemplate.'images/collapse.jpg?<?php echo time(); ?>" data-closedimage="'.$rutatemplate.'images/expand.jpg?<?php echo time(); ?>">Cocina <img src="'.$rutatemplate.'images/collapse.jpg?<?php echo time(); ?>" border="0" /></a>

<div id="cocina" style="width: 300px; background: #5BADFF; float: left;">
    <!-- Pastas -->
    <a href="javascript:animatedcollapse.toggle(\'pastas\')">Pastas <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a> <!--<a href="javascript:animatedcollapse.show(\'pastas\')">Slide Down</a> || <a href="javascript:animatedcollapse.hide(\'jason\')">Slide Up</a>-->
    <div id="pastas" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'pastas\']);aniadeorden(1,1);">Espaguetti al burro
            <br />(mantequilla, jamón y parmesano)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'pastas\']);aniadeorden(1,3);">Espaguetti a la boloñesa
            <br />(carne molida, salsa boloñesa y parmesano)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'pastas\']);aniadeorden(1,4);">1/2 orden de Espaguetti</a></li>
        </ul>
    </div>
    <!-- Carnes -->
    <a href="javascript:animatedcollapse.toggle(\'carnes\')">Carnes <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="carnes" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'carnes\']);aniadeorden(2,5);">Carne Asada</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'carnes\']);aniadeorden(2,6);">Milanesa de Res con papas</a></li>
        </ul>
    </div>
    <!-- Hamburguesas -->
    <a href="javascript:animatedcollapse.toggle(\'hamburguesas\')">Hamburguesas <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="hamburguesas" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,7);">Hamburguesa sencilla</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,8);">Hamburguesa Hawaiana
            <br />(jamón y piña)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,9);">Hamburguesa especial
            <br />(jamón, tocino y queso blanco)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,11);">Hamburguesa sencilla con papas</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,12);">Hamburguesa hawaiana con papas</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'hamburguesas\']);aniadeorden(3,13);">Hamburguesa especial con papas</a></li>
        </ul>
    </div>
    <!-- Postres -->
    <a href="javascript:animatedcollapse.toggle(\'postres\')">Postres <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="postres" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'postres\']);aniadeorden(4,14);">Chongos</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'postres\']);aniadeorden(4,15);">Durazno en almibar</a></li>
        </ul>
    </div>
    <!-- Cremas -->
    <a href="javascript:animatedcollapse.toggle(\'cremas\')">Cremas <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="cremas" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'cremas\']);aniadeorden(5,16);">Crema de champiñones</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'cremas\']);aniadeorden(5,17);">Crema de elote</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'cremas\']);aniadeorden(5,18);">Crema de esparragos</a></li>
        </ul>
    </div>
    <!-- Otros platillos -->
    <a href="javascript:animatedcollapse.toggle(\'otrosplatillos\')">Otros platillos <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="otrosplatillos" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,19);">Ensalada de jamón
            <br />con queso amarillo</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,20);">Queso fundido</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,21);">Queso fundido
            <br />(chorizo)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,22);">Queso fundido
            <br />(bistec)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,23);">Queso fundido
            <br />(champiñones)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,142);">Club sandwich</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,24);">Orden de quesadillas</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,25);">Orden de papas</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'otrosplatillos\']);aniadeorden(6,26);">Orden de pan de ajo</a></li>
        </ul>
    </div>
    <!-- Bebidas -->
    <a href="javascript:animatedcollapse.toggle(\'bebidas\')">Bebidas <img src="'.$rutatemplate.'images/toggle.jpg?<?php echo time(); ?>" border="0" /></a>
    <div id="bebidas" style="width: 350px; background: #97CBFF; display:none; float:left">
        <ul>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,27);">Refresco</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,28);">Coca cola 2 ½ LT</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,29);">Coca taparrosca</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,30);">Nescafe</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,31);">Jarra de agua (Jamaica)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,32);">Jarra de agua (Horchata)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,33);">1/2 Jarra de agua (Jamaica)</a></li>
            <li><a href="javascript:animatedcollapse.hide([\'bebidas\']);aniadeorden(8,35);">1/2 Jarra de agua (Horchata)</a></li>
        </ul>
    </div>
</div>';
?>