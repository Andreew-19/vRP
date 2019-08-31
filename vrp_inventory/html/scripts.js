var itemName = null;
var itemAmount = null;
var itemIdname = null;

$(document).ready(function () {
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open();
      openHome();
    }
    if (item.show == false) {
      close();
    }
    if (item.inventory) {
      // console.log(JSON.stringify(item.inventory, null, 2));
      $("#items").empty();
      item.inventory.forEach(element => {
        $("#items").append(`
          <div onclick="selectItem(this)" data-name="${element.name}" data-amount="${element.amount}" data-idname="${element.idname}" style="background-image: url('/gui/items/${element.idname}.png'); background-size: 80px 80px;">
            <p class="amount">${element.amount}</p>
            <p class="name">${element.name}</p>
          </div>
        `);
      });
    }
    if (item.notification == true) {
      Swal.fire(
        item.title,
        item.message,
        item.type
      )
    }
    if(item.weight && item.maxWeight) {
      $(".weight").html(item.weight + "/" + item.maxWeight + " kg");
      //$(".weight").html("200.00/200.00 KG");
    }
  });
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post('http://vrp_inventory/close', JSON.stringify({}));
    }
  };
  $(".btnClose").click(function () {
    $.post('http://vrp_inventory/close', JSON.stringify({}));
  });
});

function open() {
  $(".container").fadeIn();
  clearSelectedItem();
}
function close() {
  $(".container").fadeOut();
  $("#home").css("display", "none");
  clearSelectedItem();
}
function openHome() {
  $("#home").css("display", "block");
}

function selectItem(element) {
  itemName = element.dataset.name;
  itemAmount = element.dataset.amount;
  itemIdname = element.dataset.idname;
  $("#items div").css("background-color", "#ececec");
  $(element).css("background-color", "#27ae60");
}

function useItem() {
  let amount = $("#amount").val();
  if (amount == "0" || amount == "" || amount == null) {
    Swal.fire(
      'Eroare',
      'Nu ai selectat nici un item',
      'warning'
    )
  } else if (parseInt(amount) > parseInt(itemAmount)) {
    Swal.fire(
      'Eroare',
      'Numărul introdus este mai mare decât ceea ce aveți în inventar',
      'warning'
    )
  } else {
    if(itemIdname) {
      $.post('http://vrp_inventory/useItem', JSON.stringify({
        idname: itemIdname,
        amount: amount
      }))
      .then(() => {
        clearSelectedItem();
      });
    } else {
      Swal.fire(
        'Eroare',
        'Vă rugăm să selectați un articol',
        'warning'
      )
    }
  }
}

function dropItem() {
  let amount = $("#amount").val();
  if (amount == "0" || amount == "" || amount == null) {
    Swal.fire(
      'Eroare',
      'Vă rugăm să introduceți un număr valid',
      'warning'
    )
  } else if (parseInt(amount) > parseInt(itemAmount)) {
    Swal.fire(
      'Eroare',
      'Numărul introdus este mai mare decât ceea ce aveți în inventar',
      'warning'
    )
  } else {
    if(itemIdname !== null) {
      $.post('http://vrp_inventory/dropItem', JSON.stringify({
        idname: itemIdname,
        amount: amount
      }))
      .then(() => {
        clearSelectedItem();
      });
    } else {
      Swal.fire(
        'Eroare',
        'Vă rugăm să selectați un articol',
        'warning'
      )
    }
  }
}

function giveItem() {
  let amount = $("#amount").val();
  if (amount == "0" || amount == "" || amount == null) {
    Swal.fire(
      'Eroare',
      'Vă rugăm să introduceți un număr valid',
      'warning'
    )
  } else if (parseInt(amount) > parseInt(itemAmount)) {
    Swal.fire(
      'Eroare',
      'Numărul introdus este mai mare decât ceea ce aveți în inventar',
      'warning'
    )
  } else {
    if(itemIdname) {
      $.post('http://vrp_inventory/giveItem', JSON.stringify({
        idname: itemIdname,
        amount: amount
      }))
      .then(() => {
        clearSelectedItem();
      });
    } else {
      Swal.fire(
        'Eroare',
        'Vă rugăm să selectați un articol',
        'warning'
      )
    }
  }
}

function clearSelectedItem() {
  itemName = null;
  itemAmount = null;
  itemIdname = null;
  $("#items div").css("background-color", "#ececec");
}