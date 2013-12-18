
$(function(){
	$('#nav>li').hover(
		function(){
		$('.submenu',this).stop(true,true).slideDown('fast');
		},
		function(){
		$('.submenu',this).slideUp('fast');
		}
	);
 
	$('.submenu li a').css( {backgroundPosition: "0px 0px"} ).hover(
		function(){
		$(this).stop().animate({backgroundPosition: "(0px -99px)"}, 250);
		},
		function(){
		$(this).stop().animate({backgroundPosition: "(0px 0px)"}, 250);
		}
	);			
});

$(document).ready(function(){ // Script del Navegador
    $("ul.subnavegador").not('.selected').hide();
    $("a.desplegable").click(function(e){
      var desplegable = $(this).parent().find("ul.subnavegador");
      $('.desplegable').parent().find("ul.subnavegador").not(desplegable).slideUp('slow');
      desplegable.slideToggle('slow');
      e.preventDefault();
    })
 });

$(document).ready( function(){
	$('#slideshowHolder').jqFancyTransitions({ width: 1024, height: 650 });

});

$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    $(".boton").click(function (){
        $(".error").remove();
        if( $(".nombre").val() == "" ){
            $(".nombre").focus().after("<span class='error'>Ingrese su nombre</span>");
            return false;
        }else if( $(".email").val() == "" || !emailreg.test($(".email").val()) ){
            $(".email").focus().after("<span class='error'>Ingrese un email correcto</span>");
            return false;
        }else if( $(".asunto").val() == ""){
            $(".asunto").focus().after("<span class='error'>Ingrese un asunto</span>");
            return false;
        }else if( $(".mensaje").val() == "" ){
            $(".mensaje").focus().after("<span class='error'>Ingrese un mensaje</span>");
            return false;
        }
    });
    $(".nombre, .asunto, .mensaje").keyup(function(){
        if( $(this).val() != "" ){
            $(".error").fadeOut();
            return false;
        }
    });
    $(".email").keyup(function(){
        if( $(this).val() != "" && emailreg.test($(this).val())){
            $(".error").fadeOut();
            return false;
        }
    });
});

$(function() {
$('ul.hover_block li').hover(function(){
$(this).find('img').animate({left:'488px'},{queue:false,duration:500});
}, function(){
$(this).find('img').animate({left:'0px'},{queue:false,duration:500});
});
});


$(document).ready(init);

function init(){

	$('#caja6').hover(cambia_color2, reset);
	
	}

function cambia_color(){
	$('#caja6').css('background-color', '#F1F2F4');
	}
	
function cambia_color2(){
	$(this).css('background-color', '#BE1522').css('color', '#E3DEE5');
	}
	
function reset(){
	$(this).css('background-color', '');
	$(this).css('color', '');
	}
function getPricesInPdf()
{
var x;

var person=prompt("Ingrese su clave","miClave");

if (person!=null)
  {
  var url = "lista precios " + person + ".pdf";
  fileExists(person)
  }
  
}

function fileExists(fileLocation) {

	var response = $.ajax({
	type: 'HEAD',
    url: 'upload/show?key=' + fileLocation,
	success: function() {
        window.open('upload/show?key=' + fileLocation,"Lista de Precios","titlebar=no,toolbar=no,menubar=no"); 
    },  
    error: function() {
        window.confirm("No se ha encontrado el Archivo");
    }
    });
	}


















