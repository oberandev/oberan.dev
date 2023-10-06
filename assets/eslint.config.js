const { FlatCompat } = require("@eslint/eslintrc");
const eslintPluginImport = require("eslint-plugin-import");
const eslintPluginPrettier = require("eslint-plugin-prettier");

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

module.exports = [
  {
    plugins: {
      import: eslintPluginImport,
      prettier: eslintPluginPrettier,
    },
  },
  {
    files: ["**/*.{js,ts,mjs,mts}"],
    rules: {
      "import/first": "error",
      "import/newline-after-import": "error",
      "import/no-cycle": "error",
      "import/no-relative-parent-imports": "error",
      "import/no-self-import": "error",
      "import/order": [
        "error",
        {
          groups: [["builtin", "external", "internal"], ["sibling", "parent"], ["index"]],
          "newlines-between": "always",
          alphabetize: {
            order: "asc",
            caseInsensitive: true,
          },
        },
      ],
      "prettier/prettier": "error",
    },
  },
  ...compat.config({}).map((config) => ({
    ...config,
    files: ["**/*.js"],
    rules: {},
  })),
  ...compat.config({}).map((config) => ({
    ...config,
    files: ["**/*.ts"],
    rules: {},
  })),
  ...compat.config({}).map((config) => ({
    ...config,
    files: ["**/*.mjs"],
    rules: {},
  })),
  ...compat.config({}).map((config) => ({
    ...config,
    files: ["**/*.mts"],
    rules: {},
  })),
];
