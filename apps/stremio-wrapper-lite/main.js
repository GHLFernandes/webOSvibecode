(function () {
  'use strict';

  var frame = document.getElementById('stremio-frame');
  var splash = document.getElementById('splash');
  var STREMIO_URL = 'https://tv.strem.io';
  var loaded = false;

  var KEY_BACK = 461;
  var KEY_ENTER = 13;
  var KEY_ARROWS = [37, 38, 39, 40];

  function loadStremio() {
    if (loaded) return;
    loaded = true;
    if (splash) splash.className = 'hidden';
    frame.src = frame.getAttribute('data-src') || STREMIO_URL;
  }

  function focusFrame() {
    try {
      frame.focus();
    } catch (e) {}
  }

  frame.addEventListener('load', function () {
    if (loaded) focusFrame();
  });

  document.addEventListener('visibilitychange', function () {
    if (!document.hidden && loaded) focusFrame();
  });

  window.addEventListener('focus', function () {
    if (loaded) focusFrame();
  });

  document.addEventListener('keydown', function (event) {
    var code = event.keyCode || event.which;

    if (!loaded && (code === KEY_ENTER || KEY_ARROWS.indexOf(code) !== -1)) {
      event.preventDefault();
      loadStremio();
      return;
    }

    if (code === KEY_BACK) {
      handleBack(event);
      return;
    }

    if (KEY_ARROWS.indexOf(code) !== -1 || code === KEY_ENTER) {
      if (document.activeElement !== frame) focusFrame();
    }
  }, true);

  function handleBack(event) {
    event.preventDefault();
    event.stopPropagation();
    if (!loaded) {
      try { window.close(); } catch (e) {}
      return;
    }
    if (window.webOS && typeof window.webOS.platformBack === 'function') {
      window.webOS.platformBack();
      return;
    }
    if (window.PalmSystem && typeof window.PalmSystem.platformBack === 'function') {
      window.PalmSystem.platformBack();
      return;
    }
    try {
      window.close();
    } catch (e) {
      window.location.href = STREMIO_URL;
    }
  }

  var reloadAttempts = 0;
  frame.addEventListener('error', function () {
    if (!loaded) return;
    if (reloadAttempts < 2) {
      reloadAttempts++;
      setTimeout(function () {
        frame.src = STREMIO_URL;
      }, 3000);
    }
  });
})();
