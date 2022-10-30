<section>
<header class="is-light padded">

## Preview
</header>
</section>

<section class="images-section">
<div class="is-dark">

![Love Dark Preview 1](/images/vscode/love-dark-01.png)
</div>

<div class="is-light">

![Love Light Preview 1](/images/vscode/love-light-01.png)
</div>
</section>

<div class="spacer"></div>

<section>
<header class="is-light padded">

## Installation
</header>

<div class="is-dark padded">

### Via Visual Studio Code

1. Open the Extensions sidebar by clicking on <code>View&nbsp;->&nbsp;Extensions</code>.
1. Search for `@id:Holllo.Love`.
1. Click on the green "Install" button.
1. Done! ♥
</div>

<div class="is-light padded">

### Via the Command Line

1. Run `code --install-extension Holllo.Love`.
1. Done! ♥
</div>

<div class="is-dark padded">

### From Source

Requires [NodeJS](https://nodejs.org) and [Yarn](https://yarnpkg.com) to be installed.

With a cloned repository and your current working directory at the root of it:

1. Install the dependencies with `yarn`.
1. Build the theme with `yarn build:vscode`.
1. Change into the VS Code directory with `cd source/vscode/`.
1. Install the packaging utility by running `yarn`.
1. Create the `.vsix` package with `yarn package`.
1. Install the theme with `code --install-extension love-{{ versions.vscode }}.vsix`.
1. Done! ♥
</div>
</section>
