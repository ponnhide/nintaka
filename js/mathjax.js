window.MathJax = {
    jax: ["input/TeX","input/MathML","output/HTML-CSS","output/NativeMML"],
    extensions: ["tex2jax.js","mml2jax.js","MathMenu.js","MathZoom.js"],
    TeX: {
      extensions: ["AMSmath.js","AMSsymbols.js"]
    },
    MathML: { extensions: ["mml3.js", "content-mathml.js"]},
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true
    }
};

(function(d, script) {
    script = d.createElement('script');
    script.type = 'text/javascript';
    script.async = true;
    script.onload = function(){
        // remote script has loaded
    };
   script.src = 'https://cdn.mathjax.org/mathjax/latest/MathJax.js';
    d.getElementsByTagName('head')[0].appendChild(script);
}(document));