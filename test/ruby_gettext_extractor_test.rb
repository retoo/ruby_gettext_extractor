require 'test_helper'

# most of these tests are taken from the GetText Distribution. There are comments where
# changes had to be made.

class TestGetTextParser < Test::Unit::TestCase
  def test_ruby
    ary = RubyGettextExtracter.parse('test/cases/gettext.rb')

    assert_equal(['aaa', 'test/cases/gettext.rb:8'], ary[0])
    assert_equal(['aaa\n', 'test/cases/gettext.rb:12'], ary[1])
    assert_equal(['bbb\nccc', 'test/cases/gettext.rb:16'], ary[2])
    assert_equal(['bbb\nccc\nddd\n', 'test/cases/gettext.rb:20'], ary[3])
    assert_equal(['eee', 'test/cases/gettext.rb:27', 'test/cases/gettext.rb:31'], ary[4])
    assert_equal(['fff', 'test/cases/gettext.rb:31'], ary[5])
    # position difference, 37 instead of 35 (not relevant in daily use)
    assert_equal(['ggghhhiii', 'test/cases/gettext.rb:37'], ary[6])
    assert_equal(['a"b"c"', 'test/cases/gettext.rb:41'], ary[7])
    assert_equal(['d"e"f"', 'test/cases/gettext.rb:45'], ary[8])
    assert_equal(['jjj', 'test/cases/gettext.rb:49'], ary[9])
    assert_equal(['kkk', 'test/cases/gettext.rb:50'], ary[10])
    assert_equal(['lllmmm', 'test/cases/gettext.rb:54'], ary[11])
    # position difference caused by multiline statement, 63 instead of 62
    assert_equal(['nnn\nooo', 'test/cases/gettext.rb:63'], ary[12])
    assert_equal(["\#", 'test/cases/gettext.rb:66', 'test/cases/gettext.rb:70'], ary[13])
    assert_equal(["\\taaa", 'test/cases/gettext.rb:74'], ary[14])
    # position difference caused by here doc, 84 instead of 78 (bit annyoing
    assert_equal(["Here document1\\nHere document2\\n", 'test/cases/gettext.rb:84'], ary[15])
    assert_equal(["in_quote", 'test/cases/gettext.rb:88'], ary[16])
  end

  def test_ruby_N
    ary = RubyGettextExtracter.parse('test/cases/N_.rb')

    assert_equal(['aaa', 'test/cases/N_.rb:8'], ary[0])
    assert_equal(['aaa\n', 'test/cases/N_.rb:12'], ary[1])
    assert_equal(['bbb\nccc', 'test/cases/N_.rb:16'], ary[2])
    assert_equal(['bbb\nccc\nddd\n', 'test/cases/N_.rb:20'], ary[3])
    assert_equal(['eee', 'test/cases/N_.rb:27', 'test/cases/N_.rb:31'], ary[4])
    assert_equal(['fff', 'test/cases/N_.rb:31'], ary[5])
    # position difference caused by multilin statement, 37 instead of 35
    assert_equal(['ggghhhiii', 'test/cases/N_.rb:37'], ary[6])
    assert_equal(['a"b"c"', 'test/cases/N_.rb:41'], ary[7])
    assert_equal(['d"e"f"', 'test/cases/N_.rb:45'], ary[8])
    assert_equal(['jjj', 'test/cases/N_.rb:49'], ary[9])
    assert_equal(['kkk', 'test/cases/N_.rb:50'], ary[10])
    assert_equal(['lllmmm', 'test/cases/N_.rb:54'], ary[11])
    # position difference caused by multiline statement, 63 instead of 62
    assert_equal(['nnn\nooo', 'test/cases/N_.rb:63'], ary[12])
  end

  def test_ruby_n
    ary = RubyGettextExtracter.parse('test/cases/ngettext.rb')
    assert_equal(["aaa\000aaa2", 'test/cases/ngettext.rb:8'], ary[0])
    assert_equal(["bbb\\n\000ccc2\\nccc2", 'test/cases/ngettext.rb:12'], ary[1])
    # position difference caused by multiline statement, 18 instead of 16
    assert_equal(["ddd\\nddd\000ddd2\\nddd2", 'test/cases/ngettext.rb:18'], ary[2])
    # position difference caused by multiline statement, 23 instead of 21
    assert_equal(["eee\\neee\\n\000eee2\\neee2\\n", 'test/cases/ngettext.rb:23'], ary[3])
    assert_equal(["ddd\\neee\\n\000ddd\\neee2", 'test/cases/ngettext.rb:27'], ary[4])
    assert_equal(["fff\000fff2", 'test/cases/ngettext.rb:34', 'test/cases/ngettext.rb:38'], ary[5])
    assert_equal(["ggg\000ggg2", 'test/cases/ngettext.rb:38'], ary[6])
    # position difference caused by multiline statement, 47 instead of 42
    assert_equal(["ggghhhiii\000jjjkkklll", 'test/cases/ngettext.rb:47'], ary[7])
    assert_equal(["a\"b\"c\"\000a\"b\"c\"2", 'test/cases/ngettext.rb:51'], ary[8])
    assert_equal(["mmmmmm\000mmm2mmm2", 'test/cases/ngettext.rb:59'], ary[10])
    assert_equal(["nnn\000nnn2", 'test/cases/ngettext.rb:60'], ary[11])
  end

  def test_ruby_p
    ary = RubyGettextExtracter.parse('test/cases/pgettext.rb')
    assert_equal(["AAA\004BBB", "test/cases/pgettext.rb:8", "test/cases/pgettext.rb:12"], ary[0])
    assert_equal(["AAA|BBB\004CCC", "test/cases/pgettext.rb:16"], ary[1])
    assert_equal(["AAA\004CCC", "test/cases/pgettext.rb:20"], ary[2])
    assert_equal(["CCC\004BBB", "test/cases/pgettext.rb:24"], ary[3])
  end

  def test_new_cases
    ary = RubyGettextExtracter.parse('test/cases/new.rb')
    assert_equal(["baz", "test/cases/new.rb:5"], ary[0])
    assert_equal(["foobarbaz", "test/cases/new.rb:5"], ary[1])
    assert_equal(["world", "test/cases/new.rb:6"], ary[2])
    assert_equal(["foo", "test/cases/new.rb:6"], ary[3])
    assert_equal(["ruby_is_wicked", "test/cases/new.rb:6"], ary[4])
    assert_equal(["foocliclaclublibuzbiz", "test/cases/new.rb:7"], ary[5])
  end
end
