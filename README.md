[![Build Status](https://github.com/BerkeleyLibrary/marc-spec/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/BerkeleyLibrary/marc-spec/actions/workflows/build.yml)
[![Gem Version](https://img.shields.io/gem/v/ruby-marc-spec.svg)](https://rubygems.org/gems/ruby-marc-spec)

# MARC::Spec

A implementation of the [MARCspec](http://marcspec.github.io/MARCspec/marc-spec.html) 
query language for Ruby and [ruby-marc](https://github.com/ruby-marc/ruby-marc).

## Usage

Add `ruby-marc-spec` to your Gemfile or gemspec, or just install it:

- Gemfile:

  ```ruby
  gem 'ruby-marc-spec'
  ```

- gemspec

  ```ruby
  spec.add_dependency 'ruby-marc-spec'
  ```

- from the command line:

  ```sh
  gem install ruby-marc-spec
  ```

Then, in your code:

```ruby
require 'marc/spec'
```

The entry point for `MARC::Spec` is the `MARC::Spec#find` method, which takes a string
MARCspec query and a `MARC::Record` object.

```ruby
MARC::Spec.find('245$a', marc_record)
# => [#<MARC::Subfield:0x00007ffa1686e3f0 @code="a", @value="Arithmetic /">] 
```

Note that for simplicity's sake `MARC::Spec#find` always returns an array, even for 
queries that can only return a single-element result, e.g.

```ruby
MARC::Spec.find('LDR', marc_record)
# => ["01142cam  2200301 a 4500"]
```

## Examples

All examples below are based on the record [`sandburg.xml`](spec/data/sandburg.xml)
from the Library of Congress [MARCXML](https://www.loc.gov/standards/marcxml/) documentation.

```ruby
marc_record = MARC::XMLReader.new('sandburg.xml').first
```

### Retrieving the leader

```ruby
MARC::Spec.find('LDR', marc_record)
# => ["01142cam  2200301 a 4500"]
```

### Retrieving control fields

Find all fields whose tag begins with `00`:

```ruby
MARC::Spec.find('00.', marc_record)
# => [
#  #<MARC::ControlField:0x00007ff9f706ac40 @tag="001", @value="   92005291 ">,
#  #<MARC::ControlField:0x00007ff9f70686c0 @tag="003", @value="DLC">,
#  #<MARC::ControlField:0x00007ff9f7062450 @tag="005", @value="19930521155141.9">,
#  #<MARC::ControlField:0x00007ff9f70600d8 @tag="008", @value="920219s1993    caua   j      000 0 eng  ">
# ]
```

### Retrieving substrings of a control field value:

Find the first six characters (characters 0 through 6) of the `008` field:

```ruby
MARC::Spec.find('008/0-5', marc_record)
# => ["920219"]
```

### Retrieving data fields

Find the first two `650` fields (fields 0 and 1):

```ruby
MARC::Spec.find('650[0-1]', marc_record)
# => [#<MARC::DataField:0x00007ffa1799a5c0
#   @indicator1=" ",
#   @indicator2="0",
#   @subfields=[#<MARC::Subfield:0x00007ffa17999878 @code="a", @value="Arithmetic">, #<MARC::Subfield:0x00007ffa179984a0 @code="x", @value="Juvenile poetry.">],
#   @tag="650">,
#  #<MARC::DataField:0x00007ffa17992618
#   @indicator1=" ",
#   @indicator2="0",
#   @subfields=[#<MARC::Subfield:0x00007ffa179918d0 @code="a", @value="Children's poetry, American.">],
#   @tag="650">] 
```

### Retrieving subfields

Find subfield `a` of all 650 fields:

```ruby
MARC::Spec.find('650$a', marc_record)
#  => 
# [#<MARC::Subfield:0x00007ffa17999878 @code="a", @value="Arithmetic">,
#  #<MARC::Subfield:0x00007ffa179918d0 @code="a", @value="Children's poetry, American.">,
#  #<MARC::Subfield:0x00007ffa1798acb0 @code="a", @value="Arithmetic">,
#  #<MARC::Subfield:0x00007ffa17982cb8 @code="a", @value="American poetry.">,
#  #<MARC::Subfield:0x00007ffa17980120 @code="a", @value="Visual perception.">]
``` 

### Retrieving subfield values

Find the first six characters (characters 0 through 5) of subfield `a` 
of the fifth (zero-indexed) `650` field:

```ruby
MARC::Spec.find('650[4]$a/0-5', marc_record)
# => ["Visual"]
```

### Limiting results based on conditions:

Find all `650` fields having a value of `0` for the second indicator:

```ruby
MARC::Spec.find('650{^2=\0}', marc_record)
# => 
# [#<MARC::DataField:0x00007ffa1799a5c0
#   @indicator1=" ",
#   @indicator2="0",
#   @subfields=[#<MARC::Subfield:0x00007ffa17999878 @code="a", @value="Arithmetic">, #<MARC::Subfield:0x00007ffa179984a0 @code="x", @value="Juvenile poetry.">],
#   @tag="650">,
#  #<MARC::DataField:0x00007ffa17992618
#   @indicator1=" ",
#   @indicator2="0",
#   @subfields=[#<MARC::Subfield:0x00007ffa179918d0 @code="a", @value="Children's poetry, American.">],
#   @tag="650">] 
```

Find subfield `a` of each `650` field that also has a subfield `x`:

```ruby
MARC::Spec.find('650$a{$x}', marc_record)
# => [#<MARC::Subfield:0x00007ffa17999878 @code="a", @value="Arithmetic">, #<MARC::Subfield:0x00007ffa1798acb0 @code="a", @value="Arithmetic">] 
```

Note that this `650$a{$x}` could also be written `650$a{?$x}`; the `?` ("exists") operator
is implicit if no other operator is specified.

Find the first seven characters of `260$b`, but only if the corresponding `$a` contains
the string `San Diego` and there is at least one `050$b` containing as a substring characters
7 through 10 of the `008` field:

```ruby
MARC::Spec.find('260$b/0-7{$a~\San\sDiego}{050$b~008/7-10}', marc_record)
# => ["Harcourt"]
```

For further examples, see the MARCSpec [documentation](http://marcspec.github.io/MARCspec/marc-spec.html#marcspec-explained).

## For developers

### Generated tests

The tests for this gem include a set generated from the [MARCSpec-Test-Suite](https://github.com/MARCspec/MARCspec-Test-Suite)
project, which is provided as a [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
under `spec/suite`.

The tests themselves are in [`spec/suite/generated`](spec/suite/generated). It's not necessary to fetch the submodule in order
to run these tests, but it is necessary if you need to regenerate them. To fetch the submodule, from the project root, run:

```sh
git submodule init
git submodule update
```

To regenerate the tests, run `rake spec:generate`.
