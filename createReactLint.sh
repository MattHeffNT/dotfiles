touch .eslintrc.json; echo '{
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": ["eslint:recommended", "plugin:react/recommended"],
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 12,
        "sourceType": "module"
    },
    "plugins": ["react"],
    "rules": {
        "react/react-in-jsx-scope": "off",
        "react/no-unescaped-entities": 0
    }
}' > .eslintrc.json;

touch .prettierrc.json; echo '{
    "trailingComma": "es5",
    "tabWidth": 4,
    "semi": true,
    "singleQuote": true
}' > .prettierrc.json
 
