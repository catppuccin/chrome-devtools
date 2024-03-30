fetch(chrome.runtime.getURL('devtools.css')).then(r=>r.text()).then(r=>chrome.devtools.panels.applyStyleSheet(r));

var abc = "abc";
