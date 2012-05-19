 $(function(){

       $('.sign-btn').click(function () {
               $('.signinform').slideDown();
               $('.signin').slideUp();
       });
       $('.sign-btn-back').click(function () {
               $('.signinform').slideUp();
               $('.signin').slideDown();
       });
});
