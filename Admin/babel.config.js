module.exports = {
    presets: [
        [
            '@babel/preset-env',
            {
                useBuiltIns: 'entry',
                corejs: 3
            }
        ],
        [
            '@vue/babel-preset-jsx',
        ]
    ],
    "plugins": ["@babel/plugin-syntax-jsx"]
}
