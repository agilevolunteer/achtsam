jQuery(() => {
  let $cookieContainer = jQuery(".agv-eucookie");
  let $accept = $cookieContainer.find(".agv-eucookie__accept");

  if($cookieContainer.length == 0){
    return;
  }

  $accept.click(() => {
    document.cookie="eu-cookie=accept";
    $cookieContainer.hide().remove();
  });

});
