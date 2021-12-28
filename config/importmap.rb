# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.0/dist/esm/index.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
pin "mrujs", to: "https://ga.jspm.io/npm:mrujs@0.7.4/dist/mrujs.module.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.6.1/dist/morphdom.js"
pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@7.1.0/dist/turbo.es2017-esm.js"
