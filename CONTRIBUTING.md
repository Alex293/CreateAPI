# Contributing

Your contributions are always appreciated! To make it easier for both you and the maintainers to resolve your issues or ship your changes, please refer to the guidance below.

- [Bug Reports](#bug-reports)
- [Feature Requests](#feature-requests)
- [Pull Requests](#pull-requests)
- [Releasing](#releasing)

## Bug Reports

If you have ran into an issue using CreateAPI, when creating an issue on GitHub, please make sure that you include the following information:

- The version of CreateAPI that you were using
- A reproducible example including the schema, the config and the options that you passed to the generate command

When the instructions are clear and its easy for a maintainer to reproduce the issue, it makes it easier for everybody to find a solution.

While its not required, if you can reproduce the issue in the existing tests  and open a draft Pull Request that demonstrates the issue, that is even better! You don't have to know how to fix it, but its a great start.

## Feature Requests

We want CreateAPI to be full of rich and useful features. If you have an idea, please open an issue to start a discussion!

## Pull Requests

Submitting Pull Requests is always welcome, this could be to fix bugs, refactor code, implement new features or even to add or update documentation.

If you are changing code, please be sure to make sure that the tests pass locally before submitting your Pull Request. You can do this by running `swift test` in terminal (or <kbd>⌘</kbd> + <kbd>U</kbd> in Xcode).

### Test Fixtures

The CreateAPITests target has a series of expected fixtures committed to the repository and when running tests, to verify that the generator works as expected, the output generated by the test must match the contents committed to the repo.

If you are making a change, ether to fix/reproduce a bug, or to add a new feature, you'll likely want to update the recorded snapshots to reflect your changes. To do this, in Xcode change the Scheme to "Record Snapshots" and run the entire suite of tests.

If you want to add a new spec or configuration to the tests, you can add the schema to **Tests/Support/Specs/** and then write a new test, with the desired configuration in **GenerateTests.swift**. Be sure to use the record mode on your first run.

### Writeup

When submitting a Pull Request, please be sure to include plenty of details for the reviewers. The amount of information you should include varies by the size of the change, but please explain the motivation for your changes and provide a summary of how you have achieved that.

If you can predict that there might be questions/confusion/concern about anything in your change, explaining that in the description, or providing an inline review of your own will greatly help to speed up the feedback loop and get your change shipped faster.

## Releasing

When releasing a new version of CreateAPI, be sure to follow the steps outlined below:

- [ ] Ensure that the `main` branch checks are passing.
- [ ] Update the [version number](https://github.com/CreateAPI/CreateAPI/blob/main/Sources/CreateAPI/CreateAPI.swift#L8).
- [ ] Update the `create-api generate --help` output in **README.md** if it has changed.
- [ ] Update [CHANGELOG.md](./CHANGELOG.md).
  - Use the GitHub generated release notes as a base. Be sure to cleanup the PR links.
- [ ] Create a GitHub Release.
  - Create a new tag using semantic versioning.
  - Use the generated release notes.
- [ ] From the [Release Workflow](https://github.com/CreateAPI/CreateAPI/actions/workflows/release.yml), get the artifactbundle SHA and add an Artifact Bundle section to the release page. For example:
    > ## Artifact Bundle
    >
    > Checksum: `89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24`
    >
    > ```swift
    > .binaryTarget(
    >     name: "create-api",
    >     url: "https://github.com/CreateAPI/CreateAPI/releases/download/0.0.5/create-api.artifactbundle.zip",
    >     checksum: "89c75ec3b2938d08b961b94e70e6dd6fa0ff52a90037304d41718cd5fb58bd24"
    > )
    > ```
- [ ] Push the release to Homebrew with `brew bump-formula-pr create-api`.


---

Thanks again for contributing to CreateAPI!