touch .eslintrc.json; echo '{
    "env": {
        "es6": true
    },
    "extends": [
        "eslint:recommended",
        "plugin:react/recommended",
        "airbnb",
        "prettier",
        "prettier/react"
    ],
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly",
        "__DEV__": "readonly"
    },
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 2018,
        "sourceType": "module"
    },
    "plugins": ["react"],
    "rules": {
        "react/react-in-jsx-scope": "off",
        "react/no-unescaped-entities": 0,
        "prettier/prettier": "error"
    }
}' > .eslintrc.json;

touch .prettierrc.json; echo '{
    "trailingComma": "es5",
    "tabWidth": 4,
    "semi": true,
    "singleQuote": true
}' > .prettierrc.json


