chrome.webRequest.onHeadersReceived.addListener(function(details) {
  for (var i in details.responseHeaders) {
    var b = details.responseHeaders[i];
    if (b.name == 'CSRF_WARNING') {
      alert('Possible CSRF: ' + details.url);
    }
  }
}, {"urls":["*://*/*"]},["responseHeaders"]);
