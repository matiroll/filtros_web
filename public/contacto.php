<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php
    if(isset($_POST['boton'])){
        if($_POST['nombre'] == ''){
            $errors[1] = '<span class="error">Ingrese su nombre</span>';
        }else if($_POST['email'] == '' or !preg_match("/^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/",$_POST['email'])){
            $errors[2] = '<span class="error">Ingrese un email correcto</span>';
        }else if($_POST['asunto'] == ''){
            $errors[3] = '<span class="error">Ingrese un asunto</span>';
        }else if($_POST['mensaje'] == ''){
            $errors[4] = '<span class="error">Ingrese un mensaje</span>';
        }else{
            $dest = "contacto@hastingfiltros.com.ar"; //Email de destino
            $nombre = $_POST['nombre'];
            $email = $_POST['email'];
            $asunto = $_POST['asunto']; //Asunto
            $cuerpo = $_POST['mensaje']; //Cuerpo del mensaje
            //Cabeceras del correo
            $headers = "From: $nombre $email\r\n"; //Quien envia?
            $headers .= "X-Mailer: PHP5\n";
            $headers .= 'MIME-Version: 1.0' . "\n";
            $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; //
 
            if(mail($dest,$asunto,$cuerpo,$headers)){
                $result = '<div class="result_ok">Email enviado correctamente </div>';
                // si el envio fue exitoso reseteamos lo que el usuario escribio:
                $_POST['nombre'] = '';
                $_POST['email'] = '';
                $_POST['asunto'] = '';
                $_POST['mensaje'] = '';
            }else{
                $result = '<div class="result_fail">Hubo un error al enviar el mensaje </div>';
            }
        }
    }
?>
<head>
<title>HastingFiltros.com.ar</title>
<meta charset="utf-8">
<link rel="shortcut icon" href="img/favicon_h.ico"/>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">

<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>
<script src="js/jqFancyTransitions.min.js" type="text/javascript"></script>
</head>

<body>

<div id="superior">
 <div id="superior_adentro"></div>
</div>
  
<!-- link -->

<div id="fondo_link">
 <div id="link">
   <ul class="nav">
	<li>
		<a href="index.html">Inicio<span class="flecha">&#9660;</span></a>
	         </li>
             
          <li>
		<a href="historia.html">Nuestra Empresa<span class="flecha">&#9660;</span></a>
	       </li>
           
  <li>
	<a href="#">Politicas de Calidad<span class="flecha">&#9660;</span></a>
	   <ul>
		 <li><a href="calidad_filtros_hasting.html">calidad filtros hasting<span class="flecha">&#9660;</span></a></li>
			<li>
			  <a href="certificado_iso.html">certificado ISO<span class="flecha">&#9660;</span></a>
        </li>
                  </ul>	
                  
    <li>
	<a href="#">Productos<span class="flecha">&#9660;</span></a>
	   <ul>
		 <li><a href="filtro_de_aire.html">filtros de aire<span class="flecha">&#9660;</span></a></li>
			<li>
			  <a href="filtro_de_aceite.html">filtros de aceite<span class="flecha">&#9660;</span></a>
        </li>
                  <li>
			        <a href="filtro_de_combustible.html">filtros de combustible<span class="flecha">&#9660;</span></a>
          </li>
                      <li>
			  <a href="filtro_de_habitaculo.html">filtros de habitaculo<span class="flecha">&#9660;</span></a>
          </li>
                
                <li>
			  <a href="filtro_especiales.html">filtros especiales<span class="flecha">&#9660;</span></a>
        </li>
                
                  </ul>	
                  
                  <li>
		<a href="catalogo_online.html" target="_self">Catalogo<span class="flecha">&#9660;</span></a>
</li>
             
             <li>
		<a href="lista_de_precios.html">Lista de Precios<span class="flecha">&#9660;</span></a>
      </li>
             
             <li>
		<a href="articulos.html">Novedades<span class="flecha">&#9660;</span></a>
      </li>
             
             <li>
		<a href="contacto.html">Contacto<span class="flecha">&#9660;</span></a>
	         </li>
			
</ul>
  </div>
</div>
             
<!-- banner -->
             
<div id="banner_internas">
 <div id="banner_adentro_contacto"> 
   <div id="publicidades_internas">
    <div id="direccion"> 
      
      
    </div>
     <div id="catalogo_interna"><a href="catalogo_online.html" target="_blank"><img src="img/catalogo.jpg" width="247" height="350" /></a></div>
        </div>
  </div>
    
 
</div>
          
<!-- informacion -->

 <div id="texto">
   <div id="informacion">
     <br />
     <br />
     <h2>Contacto</h2>
       <br />
       <br />
 <form class='contacto' method='POST' action=''>
            <div><label>Tu Nombre:</label><input type='text' class='nombre' name='nombre' value='<?php echo $_POST['nombre']; ?>'><?php echo $errors[1] ?></div>
            <div><label>Tu Email:</label><input type='text' class='email' name='email' value='<?php echo $_POST['email']; ?>'><?php echo $errors[2] ?></div>
            <div><label>Asunto:</label><input type='text' class='asunto' name='asunto' value='<?php echo $_POST['asunto']; ?>'><?php echo $errors[3] ?></div>
            <div><label>Mensaje:</label><textarea rows='6' class='mensaje' name='mensaje'><?php echo $_POST['mensaje']; ?></textarea><?php echo $errors[4] ?></div>
            <div><input type='submit' value='Envia Mensaje' class='boton' name='boton'></div>
            <?php echo $result; ?>
        </form>
     <br />
       <br />

     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     
   </div>
</div>
 
   

<!-- final -->

<div id="final">
 <div class="final_titulo" id="final_adentro">
   <table width="1024" cellpadding="0" cellspacing="0">
     <tr>
       <td width="1024" height="50" align="left" valign="middle">25 de Mayo 2020 / CP 3500 / Resistencia / Chaco / Argentina / ® Copyright Hasting 2013 / Todos los derechos Reservados</td>
     </tr>
   </table>
 </div>
</div>

</body>
</html>
