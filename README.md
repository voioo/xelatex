# LaTeX to PDF GitHub Action

This GitHub Action compiles a LaTeX file to PDF using an Alpine Linux Docker image with XeLaTeX installed.

## Usage

To use this GitHub Action, you'll need to create a workflow file in your repository's `.github/workflows` directory. For example, you could create a file called `build-pdf.yml` with the following contents:

```yaml
name: Build PDF

on:
  push:
    paths:
      - '**/*.tex'

jobs:
  build-pdf:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: docker://ghcr.io/qjoly/xelatex:latest
      with:
        args: |
          document.tex
    - uses: actions/upload-artifact@v2
      with:
        name: document
        path: |
          document.pdf
```

This workflow specifies that it should be triggered on push events where at least one `.tex` file is modified. It also specifies a single job that runs on the latest version of Ubuntu. The job has three steps:

1. Check out the repository using the `actions/checkout` action.
2. Run the Docker image `ghcr.io/qjoly/xelatex:latest` to compile the `document.tex` file. You can replace `document.tex` with the name of your own LaTeX file.
3. Upload the resulting `document.pdf` file as an artifact.

## Inputs

### `args`

**Required** The arguments to pass to the Docker image's `CMD` command. This should include the `xelatex` command to compile your LaTeX file. The default value is `xelatex -interaction=nonstopmode -halt-on-error document.tex`.

## Outputs

This GitHub Action does not have any outputs.

## Example

Here's an example of how you could use this GitHub Action in a workflow:

```yaml
name: Build PDF

on:
  push:
    paths:
      - '**/*.tex'

jobs:
  build-pdf:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: docker://ghcr.io/qjoly/xelatex:latest
      with:
        args: |
          document.tex
    - uses: actions/upload-artifact@v2
      with:
        name: document
        path: |
          document.pdf
```

This workflow will trigger whenever a `.tex` file is pushed to the repository. It will compile the `document.tex` file to PDF using the `ghcr.io/qjoly/xelatex:latest` Docker image, and then upload the resulting `document.pdf` file as an artifact.

## License

This GitHub Action is licensed under the [MIT License](LICENSE).
