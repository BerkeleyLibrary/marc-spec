# 0.1.2 (2022-02-01)

- Adds `MARC::Spec#exists?` to check if a MARC record has data matching a
  query, without actually retrieving the data. This is slightly more efficient
  than using `MARC::Spec#find` with `any?`, as it will return early when it 
  finds the first result.

# 0.1.1 (2021-10-18)

- `MARC::Spec` methods now raise an `ArgumentError` for invalid query strings
  instead of returning a raw `Parslet::ParseFailed`.
- Add `MARC::Spec#parse_query` and `MARC::Spec#execute_query` to facilitate
  caching parsed query objects. (Not that parsing is expensive, but sometimes
  it's convenient to be able to treat the query as a structured object rather
  than a string.)
- Add `MARC::Spec::Queries::Query#tag_str` to retrieve the MARC tag specifier
  from a query object. Note that this returns a MARCSpec `fieldTag` string
  (which may include `.` wildcard characters), plus an optional, bracketed
  `index`. For more information see 
  [9.2 Reference to field data](http://marcspec.github.io/MARCspec/marc-spec.html#reference-to-field-data)
  in the MARCSpec docs.

# 0.1.0 (2021-10-15)

- Initial release.
