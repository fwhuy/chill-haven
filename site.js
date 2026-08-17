(function () {
  var here = location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a').forEach(function (link) {
    if (link.getAttribute('href') === here) link.setAttribute('aria-current', 'page');
  });

  var targets = document.querySelectorAll('.reveal');
  if (!('IntersectionObserver' in window)) {
    targets.forEach(function (el) { el.classList.add('shown'); });
    return;
  }
  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('shown');
        observer.unobserve(entry.target);
      }
    });
  }, { rootMargin: '0px 0px -10% 0px' });
  targets.forEach(function (el) { observer.observe(el); });
})();
