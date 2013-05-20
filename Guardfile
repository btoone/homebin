# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :tmux, :display_message => true

guard 'minitest', test_folders: '.', bundler: false, rubygems: true do
  # todo: currently guard won't run tests when foo.rb changes. It will run the test when I hit
  # return but it also runs all tests. and for some reason that is 433 tests. If i remove the
  # test_folders options then it doens't run any tests. I think i need to create a folder sturcture.
  # I think the minitest guard is expecting that
  watch('foo.rb')

  # watch('./foo.rb')
  # watch('./foo.rb') { 'foo_spec.rb' }
  # watch('./foo.rb') { './foo_spec.rb' }

  # watch('b64') {`./b64`}
  # with Minitest::Spec
  # watch(%r|^spec/(.*)_spec\.rb|)
  # watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end
