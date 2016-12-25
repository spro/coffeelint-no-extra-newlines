module.exports = class NoExtraNewlines
    rule:
        name: 'no_extra_newlines'
        level: 'ignore'
        message: "Extra newlines"
        description: '''This rule checks for unnecessary extra newlines between lines of code.'''

    max_empty: 1
    n_empty: 0

    lintLine: (line, lineApi) ->
        if line.match(/^\s*$/) and not lineApi.isLastLine()
            @n_empty += 1
        else
            @n_empty = 0

        return @n_empty > @max_empty

