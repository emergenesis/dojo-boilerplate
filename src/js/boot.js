/**
 * This file is used to reconfigure parts of the loader at runtime for this application. We've put this extra
 * configuration in a separate file, instead of adding it directly to index.html, because it contains options that
 * can be shared if the application is run on both the client and the server.
 *
 * This file must remain outside of any defined package directory at the current time or it will be transformed by the
 * build system into a legacy module.
 */
require({
    // The base path for all packages and modules. If you don't provide this, baseUrl defaults to the directory
    // that contains dojo.js.
    baseUrl: 'js/',

    // A list of packages to register. Strictly speaking, you do not need to register any packages,
    // but you can't require "app" and get app/main.js if you do not register the "app" package (the loader will look
    // for a module at app.js instead). Unregistered packages also cannot use the packageMap feature, which might
    // be important to you if you need to relocate dependencies.
    packages: [
        { name: 'dojo', location: 'dojo' },
        { name: 'dijit', location: 'dijit' },
        //{ name: 'dojox', location: 'dojox' },
        { name: 'app', location: 'app' }
    ]
// Require 'app'. This loads the main application file, app/main.js.
}, [ 'app' ]);
