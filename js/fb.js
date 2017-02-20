$(document).ready(function() {
  $.ajaxSetup({ cache: true });
    $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
    FB.init({
      appId: 'EAACEdEose0cBAN5BiOomjXMPUEZBE3V3ln0kGW5ZAkuqTIZCAAh6pfa5ZBnBMfWORSpcRiyULZBSqI6Y7IG02BvJ2iAZCELnhF7gLpXZBDKIwJSlk8HUNutSNnzlq50TFF0rczq2DbAOFEI8Opc0Gs2NZBBdPL6vSd3XGWZAFGZA4ZAjAZDZD',
      version: 'v2.8' // or v2.0, v2.1, v2.2, v2.3
      });     
    $('#loginbutton,#feedbutton').removeAttr('disabled');
    FB.getLoginStatus(updateStatusCallback);
  });
});

FB.api(
  '/198808274035/events',
    'GET',
  {},
    function(response) {
      console.log(response);
   }
);
