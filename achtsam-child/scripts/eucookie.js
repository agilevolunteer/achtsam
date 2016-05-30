jQuery(() => {
  let $cookieContainer = jQuery(".agv-eucookie");
  let $accept = $cookieContainer.find(".agv-eucookie__accept");

  if($cookieContainer.length == 0){
    return;
  }

  $accept.click(() => {
    var now = new Date();
    var time = now.getTime();
    var expireTime = time + 1000*60*60*24*365;
    now.setTime(expireTime);
    document.cookie = 'eu-cookie=accept;expires='+now.toGMTString()+';path=/';
    $cookieContainer.hide().remove();
  });

});
