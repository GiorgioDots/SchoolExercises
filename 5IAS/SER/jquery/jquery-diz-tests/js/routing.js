(function ($) {
  var app = $.sammy('#app', function () {
    this.get('#/', function (context) {
      context.app.swap('');
      context.render('components/home.html', {})
        .appendTo(context.$element());
    });
    this.get('#/login/', function (context) {
      let user = localStorage.getItem('user');
      if (!user) {
        context.app.swap('');
        context.render('components/auth/login.html', {})
          .appendTo(context.$element());
      }
    });
    this.get('#/signup/', function (context) {
      let user = localStorage.getItem('user');
      if (!user) {
        context.app.swap('');
        context.render('components/auth/signup.html', {})
          .appendTo(context.$element());
      }
    });
    this.get('#/dictionary/', function (context) {
      let user = localStorage.getItem('user');
      context.app.swap('');
      context.render('components/dictionary/dictionary.html', {})
        .appendTo(context.$element());
    });
    this.before('.*', function () {
      var hash = document.location.hash;
      $('nav').find('a').removeClass('current');
      $('nav').find("a[href='" + hash + "']").addClass("current");
    });
  });

  $(function () {
    app.run('#/');
  });
})(jQuery);