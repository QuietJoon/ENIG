ENIG
====

ENIG is an acronym of typical Korean particles "Eun Neun I Ga (은는이가)".
Korean postposition particles change their form depending on the pronounciation of the previous consonant.
However, in trouble, because figuring out the previous consonant is not an easy problem.
Therefore, most of the programmers who handle Korean treat Korean by starting with "SOMETHING은(는) ~~".
This seems to be awkward in a sentence like "SOMETHING is(are), Two apple(s)."

ENIG focuses on programmers to handle Korean strings.

## Long-range Plans

### Korean

* Managing Korean string which involves Korean particle.

### English

* Managing English string which involves plural/singular form.

## Known Issues

### Get error like `hGetContents: invalid argument`

When you got a message during test the library like:

    test\Test\ENIG\Data.hs:16:9: error:
        ? Exception when trying to run compile-time code:
            test\Test\ENIG\Data.hs: hGetContents: invalid argument (invalid byte sequence)
          Code: testGroupGenerator
        ? In the untyped splice: $(testGroupGenerator)
       |
    16 | tests = $(testGroupGenerator)
       |         ^^^^^^^^^^^^^^^^^^^^^


This is not program error.
You should set your shell's encoding by `chcp 65001` or `export LC_ALL=en_US.UTF-8`.
