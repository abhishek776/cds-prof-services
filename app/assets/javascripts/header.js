  $(document)
    .ready(function() {

      // fix main menu to page on passing
      $('.main.menu').visibility({
        type: 'fixed'
      });
      $('.overlay').visibility({
        type: 'fixed',
        offset: 80
      });

      // show dropdown on hover
      $('.right.menu  .ui.dropdown').dropdown({
        on: 'hover'
      });
    })
  ;