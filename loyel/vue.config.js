const path = require("path");

module.exports = {
    //publicPath: 'https://cdn.jsdelivr.net/gh/rofequl/cdn/loyel/frontend/',
    lintOnSave: false,
    configureWebpack: {
        resolve: {
            alias: {
                vue$: "vue/dist/vue.runtime.esm.js",
            },
        },
    },
    devServer: {
        proxy: "http://127.0.0.1:8000/",
    },
    css: {
        loaderOptions: {
            postcss: {
                config: {
                    path: __dirname,
                },
            },
        },
    },
};
