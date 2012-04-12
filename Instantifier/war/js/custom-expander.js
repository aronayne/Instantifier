//$.expander.defaults.slicePoint = 40;

$(document).ready(function() {
  // simple example, using all default options unless overridden globally
  //$('div.expandable p').expander();

  // *** OR ***

  // override default options (also overrides global overrides)
  $('div.expandable href').expander({
    slicePoint:       40,  // default is 100
    expandPrefix:     ' ', // default is '... '
    expandText:       '[...]', // default is 'read more'
    collapseTimer:    5000, // re-collapses after 5 seconds; default is 0, so no re-collapsing
    userCollapseText: '[^]'  // default is 'read less'
  });

});
