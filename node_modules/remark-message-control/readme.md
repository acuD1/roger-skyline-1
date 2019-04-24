# remark-message-control

[![Build][build-badge]][build]
[![Coverage][coverage-badge]][coverage]
[![Downloads][downloads-badge]][downloads]
[![Chat][chat-badge]][chat]
[![Sponsors][sponsors-badge]][collective]
[![Backers][backers-badge]][collective]

Enable, disable, and ignore messages with [**remark**][remark].

## Installation

[npm][]:

```bash
npm install remark-message-control
```

## Usage

Say we have the following file, `example.md`:

```markdown
<!--foo ignore-->

## Heading
```

And our script, `example.js`, looks as follows:

```javascript
var vfile = require('to-vfile')
var report = require('vfile-reporter')
var remark = require('remark')
var control = require('remark-message-control')

remark()
  .use(warn)
  .use(control, {name: 'foo'})
  .process(vfile.readSync('example.md'), function(err, file) {
    console.error(report(err || file))
  })

function warn() {
  return function(tree, file) {
    file.message('Whoops!', tree.children[1], 'foo:thing')
  }
}
```

Now, running `node example` yields:

```markdown
example.md: no issues found
```

## API

### `remark.use(control, options)`

Let comment markers control messages from a certain sources.

##### Options

###### `options.name`

`string` — Name of markers that can control the message sources.

For example, `{name: 'alpha'}` controls `alpha` markers:

```markdown
<!--alpha ignore-->
```

###### `options.known`

`Array.<string>`, optional — List of allowed `ruleId`s.  When given, a warning
is shown when someone tries to control an unknown rule.

For example, `{name: 'alpha', known: ['bravo']}` results in a warning if
`charlie` is configured:

```markdown
<!--alpha ignore charlie-->
```

###### `options.reset`

`boolean`, default: `false` — Whether to treat all messages as turned off
initially.

###### `options.enable`

`Array.<string>`, optional — List of allowed `ruleId`s used when `reset: true`
to initially turn on.  By default (`reset: false`), all rules are turned on.

###### `options.disable`

`Array.<string>`, optional — List of disallowed `ruleId`s used when
`reset: false` to initially turn off.

###### `options.sources`

`string` or `Array.<string>`, optional — One or more sources which markers by
the specified `name` can control.  Defaults to `options.name`.

### Markers

###### `disable`

The **disable** marker turns off all messages of the given rule
identifiers.  When without identifiers, all messages are turned
off.

For example, to turn off certain messages:

```md
<!--lint disable list-item-bullet-indent strong-marker-->

*   **foo**

A paragraph, and now another list.

  * __bar__
```

###### `enable`

The **enable** marker turns on all messages of the given rule
identifiers.  When without identifiers, all messages are turned
on.

For example, to enable certain messages:

```md
<!--lint enable strong-marker-->

**foo** and __bar__.
```

###### `ignore`

The **ignore** marker turns off all messages of the given rule
identifiers occurring in the following node.  When without
identifiers, all messages are turned off.

After the end of the following node, messages are allowed again.

For example, to turn off certain messages for the next node:

```md
<!--lint ignore list-item-bullet-indent strong-marker-->

*   **foo**
  * __bar__
```

## Contribute

See [`contributing.md` in `remarkjs/remark`][contributing] for ways to get
started.

This organisation has a [Code of Conduct][coc].  By interacting with this
repository, organisation, or community you agree to abide by its terms.

## License

[MIT][license] © [Titus Wormer][author]

<!-- Definitions -->

[build-badge]: https://img.shields.io/travis/remarkjs/remark-message-control.svg

[build]: https://travis-ci.org/remarkjs/remark-message-control

[coverage-badge]: https://img.shields.io/codecov/c/github/remarkjs/remark-message-control.svg

[coverage]: https://codecov.io/github/remarkjs/remark-message-control

[downloads-badge]: https://img.shields.io/npm/dm/remark-message-control.svg

[downloads]: https://www.npmjs.com/package/remark-message-control

[chat-badge]: https://img.shields.io/badge/join%20the%20community-on%20spectrum-7b16ff.svg

[chat]: https://spectrum.chat/unified/remark

[sponsors-badge]: https://opencollective.com/unified/sponsors/badge.svg

[backers-badge]: https://opencollective.com/unified/backers/badge.svg

[collective]: https://opencollective.com/unified

[license]: license

[author]: https://wooorm.com

[npm]: https://docs.npmjs.com/cli/install

[remark]: https://github.com/remarkjs/remark

[contributing]: https://github.com/remarkjs/remark/blob/master/contributing.md

[coc]: https://github.com/remarkjs/remark/blob/master/code-of-conduct.md
