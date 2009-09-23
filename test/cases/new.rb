def _(arg)
  return arg
end
x = _"baz"
puts _("foo" + "bar" + "baz")
puts "Hello #{_'world'} #{_("foo")} #{"#{_("ruby_is_wicked")}"}"
puts _("foo" + ("cli" + "cla" + "clu") + ("bli" + ("buz" + "biz")))
url = "/flash/fff.swf?mtitle=#{_('Movie missing')}&file=/flash/send_your_movie.flv&preview_img=/images/no_cover.gif"

# haml output of code above
_hamlout.push_text("asdfasfasfd\n", 0, false); def _(m); return m; end;
 url = "/flash/fff.swf?mtitle=#{_('Movie missing')}&file=/flash/send_your_movie.flv&preview_img=/images/no_cover.gif";
_hamlout.push_text("asfasdf\n", 0, false);