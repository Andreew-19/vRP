
 var $inner = $('.inner'),
     $spin = $('#spin'),
     $reset = $('#reset'),
     $data = $('.data'),
     $mask = $('.mask'),
     $msg = $('#msg-container'),
     maskDefault = 'OBSTAW KOLOR',
     $red = $('#red'),
     $black = $('#black'),
     $green = $('#green'),
     $img = $('#wonimg'),
     $saldoh = $('#saldos'),
     $saldor = $('#saldo'),
     $clear = $('#clear'),
     $plus10 = $('#p10'),
     $plus100 = $('#p100'),
     $plus1000 = $('#p1000'),
     $plus10000 = $('#p10000'),
     $x12 = $('#x12'),
     $x2 = $('#x2'),
     $max = $('#max'),
     timer = 13000;

var red = [32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3];
var foo= new Audio("./soundeffect.mp3");
var windio= new Audio("./img/win.mp3");
var losdio= new Audio("./img/lose.mp3");
var bet = null
var audio = true
var saldo = $saldor.html();
var max_bet = 50000
$saldoh.html('Cash: '+saldo+'$')
$msg.html('Onyx Roulette');
$reset.hide();


$(function() {
  window.addEventListener('message', function(event) {
		   
    

    if (event.data.type == "openGeneral"){
      $('#body').css('display', 'block')
      $('#saldo').html(event.data.cash)
      $('#saldos').html('Cash: '+event.data.cash+'$')
    }else if (event.data.type == "closeAll"){
        $('#body').css('display', 'none')
    }else if (event.data.type == "setCash"){
      $('#saldo').html(event.data.cash)
      $('#saldos').html('Cash: '+event.data.cash+'$')
    }
    
  });
});

$clear.on('click', function(){
  $('#stawka').val(null);
});

$plus10.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget+10)
});

$plus100.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget+100)
});

$plus1000.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget+1000)
});

$plus10000.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget+10000)
});

$x12.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget/2)
});

$x2.on('click', function(){
  var toget = $('#stawka').val();
  $('#stawka').val(+toget*2)
});

$max.on('click', function(){
  var toget = $('#saldo').html();
  if (+toget > max_bet) {
  $('#stawka').val(max_bet)
  } else {
  $('#stawka').val(+toget)
  }
});


$red.on('click', function(){
  bet = 'red'
  $red.css({'box-shadow': '0px 0px 17px 3px rgba(255,119,0,1)'});
  $green.css({'box-shadow': ''});
  $black.css({'box-shadow': ''});
});

$black.on('click', function(){
  bet = 'black'
  $black.css({'box-shadow': '0px 0px 17px 3px rgba(255,119,0,1)'});
  $red.css({'box-shadow': ''});
  $green.css({'box-shadow': ''});
});

$green.on('click', function(){
  bet = 'green'
  $green.css({'box-shadow': '0px 0px 17px 3px rgba(255,119,0,1)'});
  $red.css({'box-shadow': ''});
  $black.css({'box-shadow': ''});
});

$spin.on('click',function(){
if (bet == null) {
  $msg.html('Trebuie sa alegi o culoare')
} else {
var stawka = $('#stawka').val();
var saldo = $saldor.html();
if (+stawka < 100) {
  $msg.html('Suma minima pariata trebuie sa fie de 100 $')
} else if (+stawka > max_bet) {
  $msg.html('Suma maxima pe care o poti paria este de 50,000 $')
} else {
  if (+stawka > +saldo) {
    $msg.html('Nu ai destui bani la tine')
  } else {
  foo.play();
  var wlasciwesaldo = +saldo - +stawka
  $saldor.html(wlasciwesaldo);
  $saldoh.html('Cash: '+wlasciwesaldo+'$');
  $.post('http://vrp_ruleta/lose', JSON.stringify({
    amount: +stawka,
  }));
  $red.attr('disabled', 'disabled')
  $green.attr('disabled', 'disabled')
  $black.attr('disabled', 'disabled')
  $('#stawka').attr('disabled', 'disabled')
  // get a random number between 0 and 36 and apply it to the nth-child selector
 var  randomNumber = Math.floor(Math.random() * 36),
      color = null;
      $inner.attr('data-spinto', randomNumber).find('li:nth-child('+ randomNumber +') input').prop('checked','checked');
      // prevent repeated clicks on the spin button by hiding it
       $(this).hide();
      // disable the reset button until the ball has stopped spinning
       $reset.addClass('disabled').prop('disabled','disabled').show();
  
       $msg.html('Tine-te bine de buzunar !');
  
 
  
  // remove the disabled attribute when the ball has stopped
  setTimeout(function() {
    $reset.removeClass('disabled').prop('disabled','');
    
    if($.inArray(randomNumber, red) !== -1){ color = 'red'} else { color = 'black'};
    if(randomNumber == 0){color = 'green'};
    
    $('.result-number').text(randomNumber);
    $('.result-color').text(color);
    $('.result').css({'background-color': ''+color+''});
    $data.addClass('reveal');
    $inner.addClass('rest');
    var multiplier = 2
    if (color == 'black') {
      multiplier = 2
    } else if (color == 'red') {
      multiplier = 2
    } else if (color == 'green') {
      multiplier = 14
    }
    var wygrana = stawka*multiplier
    var towin = +wlasciwesaldo + +wygrana
    var tolose = +wlasciwesaldo - +stawka
    if (color == bet) {
      $thisResult = '<li style="color:#ffbf00;" class="previous-result color-'+ color +'"><span class="previous-number">'+ randomNumber +'</span><span class="previous-color">Ai castigat !</span></li>';
      $msg.html('<span style="color:#ffbf00;">Ai castigat !'+wygrana+'$');
      $.post('http://vrp_ruleta/win', JSON.stringify({
        amount: wygrana,
      }));
      windio.play()
      $saldoh.html('Saldo: '+towin+'$')
      $saldor.html(towin)
    } else if (color != bet) {
      $msg.html('Ai pierdut');
      $thisResult = '<li class="previous-result color-'+ color +'"><span class="previous-number">'+ randomNumber +'</span><span class="previous-color">Ai pierdut !</span></li>';
        losdio.play()
      console.log('Przegrał '+tolose)
    }
    $red.removeAttr('disabled')
    $green.removeAttr('disabled')
    $black.removeAttr('disabled')
    $('#stawka').removeAttr('disabled')
     
    $('.previous-list').prepend($thisResult);
   
    
    }, timer);
  }
  }
  }
});


$reset.on('click',function(){
  // remove the spinto data attr so the ball 'resets'
  $inner.attr('data-spinto','').removeClass('rest');
  $(this).hide();
  $spin.show();
  $data.removeClass('reveal');
});

// so you can swipe it too
var myElement = document.getElementById('plate');
var mc = new Hammer(myElement);
mc.on("swipe", function(ev) {
  if(!$reset.hasClass('disabled')){
    if($spin.is(':visible')){
      $spin.click();  
    } else {
      $reset.click();
    }
  }  
});


function toggleAudio(){
	if (!audio){
		audio = !audio;
		for (var x of spin){
			x.volume = 0.5;
		}
		for (var x of coin){
			x.volume = 0.5;
		}
		win.volume = 1.0;
		lose.volume = 1.0;
	}else{
		audio = !audio;
		for (var x of spin){
			x.volume = 0;
		}
		for (var x of coin){
			x.volume = 0;
		}
		win.volume = 0;
		lose.volume = 0;
	}
	document.getElementById("audio-btn").src = "img/audio"+(audio?"On":"Off")+".png";
}

document.onkeyup = function(data){
	if (data.which == 27){
		$('.general').css('display', 'none')
		$.post('http://vrp_ruleta/NUIFocusOff', JSON.stringify({}));
	}
}