def _(arg)
  return arg
end
x = _"baz"
puts _("foo" + "bar" + "baz")
puts "Hello #{_'world'} #{_("foo")} #{"#{_("ruby_is_wicked")}"}"
puts _("foo" + ("cli" + "cla" + "clu") + ("bli" + ("buz" + "biz")))