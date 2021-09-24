# suite

The `suite` directory is a Git [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) cloned from
[MARCspec/MARCspec-Test-Suite](https://github.com/MARCspec/MARCspec-Test-Suite). Specs in 
[marc/spec/parser](marc/spec/parser) are generated based on the JSON in this suite via the
[spec::parsers::generate](Work/marc_spec/rakelib/spec_parsers_generate.rake) rake task.

Note that after cloning this project for the first time you’ll need to initialize and pull
the submodule:

```sh
git submodule init
git submodule update
```

See the [Git submodule docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for more information.
