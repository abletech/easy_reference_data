Build instructions
------------------

1. Update `lib/easy/reference_data/version.rb` with new version number
2. Update `ChangeLog` with description of changes
3. Commit and tag with new version. Eg: `v1.1.0`
4. Run: `gem build easy_reference_data`
5. Run: `gem push easy_reference_data-v<version>.gem`
6. Push commits and tags:

```
git push origin master
git push origin --tags
```

Finally, confirm that the published version is visible on RubyGems:

https://rubygems.org/gems/easy_reference_data
