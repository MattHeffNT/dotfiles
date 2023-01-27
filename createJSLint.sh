touch .eslintrc.json; echo '{
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": ["eslint:recommended"],
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 12,
        "sourceType": "module"
    },
    "rules": {

    }
}' > .eslintrc.json;

touch .prettierrc.json; echo '{
	"printWidth":120,
    "trailingComma": "es5",
    "tabWidth": 4,
    "semi": true,
    "singleQuote": true
}' > .prettierrc.json
 
