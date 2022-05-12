# hugo conventional logs theme
Copy hugo-conventional-logs-theme inside your my-hugo-site/theme

## config.yaml example
All config params are optionals.
```yaml
baseURL: 'http://conventional-logs.org/'
languageCode: en-us
title: Conventional Logs
theme: conventional-logs

# Language
defaultContentLanguageInSubdir: true
defaultContentLanguage: "en"
languages:
  en:
    weight: 1
    languageName: "English"
  it:
    weight: 2
    languageName: "Italian"

# Content
params:
  versions:
    current: 1.0.0-beta.2
    list:
    - label: 1.0.0-beta
      url: 'https://github.com/conventional-logs/conventionallogs.org'
    - label: 1.0.0-beta.1
      url: 'https://github.com/conventional-logs/conventionallogs.org'
    - label: 1.0.0-beta.2
      url: 'https://github.com/conventional-logs/conventionallogs.org'

  welcome:
    description: A specification made for write standardized and useful log messages
    image: 'https://path-to-image'
    actions:
    - label: Read the specs
      url: 'https://github.com/conventional-logs/conventionallogs.org'
    - label: GitHub
      url: 'https://github.com/conventional-logs/conventionallogs.org'

  license:
    title: License
    action:
      label: Creative Commons - CC BY 3.0
      url: 'https://creativecommons.org/licenses/by/3.0/'

  footer:
    logos:
    - name: github
      url: 'https://github.com/conventional-logs/conventionallogs.org'
```

## Apply theme changes
Development script
```ssh
npm run start
```

Production script
```ssh
npm run build
```

## Shortcodes
* banner-image
  * src (optional) | default: static/img/log-flow.png