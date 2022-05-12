# ConventionalLogs.org

[![Conventional Logs](https://img.shields.io/badge/Conventional%20Logs-v0.0.1-6586F2)](https://conventionallogs.org)

This repo is the home of the Conventional Logs specification.

## Repo Layout

We use [HUGO](https://gohugo.io/) as static site generator, so we use the [directory structure](https://gohugo.io/getting-started/directory-structure/) HUGO proposes.

#### Our implementation

* `./content`: contains all the versions of the specification.
* `./content/next/`: contains the version of the specification (where all the changes SHOULD be made).
* `./content/**/index.[lang].md`: contains the content of the specification, if a language is specified it's a translation.

## Contributing

We'd love your help to refine the language of this specification,
fixing typos, or adding more translations. Please don't hesitate
to send a pull request.

### Adding a translation

1. Create a new file in `./content/version/index.[lang].md` using the hugo command `hugo new [version]/index.[lang].md`.
1. Ensure all files have the appropriate fields required (see others as an example)..
1. Add the language to the `config.yaml` file (see others as an example).

### Running project locally

There's a docker-compose.yml file ready that will help you to check if the website looks good!
To run it, make sure you have [docker-compose installed](https://docs.docker.com/compose/install/#install-compose) on your machine and just use the command `docker-compose up` to make it run locally.

Once the website will be compiled, you can see the website visiting `http://localhost:1313`

## Badges!

Tell your users that you use the Conventional Logs specification:

```markdown
[![Conventional Logs](https://img.shields.io/badge/Conventional%20Logs-v0.0.1-6586F2)](https://conventionallogs.org)
```

## Thank you

To **[Lorenzo D'Ianni](https://github.com/lorenzodianni)** for the great effort creating the CSS and the HTML for the new UI.

To **[Netlify](https://www.netlify.com/)** to host our project, giving us a lot of [amazing built-in functionality](https://www.netlify.com/features/) for free.
