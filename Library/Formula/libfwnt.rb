# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libfwnt < Formula
  desc "libfwnt is a library for Windows NT data types"
  homepage "https://github.com/libyal/libfwnt/wiki"
  url "https://github.com/libyal/libfwnt/archive/20150618.tar.gz"
  sha256 "56ea9500c7900990610577e578adc3b8bee36ec550fd85c73b8d09e477f9e250"
  version "20150618"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext" => :build
  depends_on "libtool" => :build
  depends_on "pkgconfig" => :build
  depends_on "pkgconfig" => :build

  def install
    system "./synclibs.sh"
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          "--enable-static",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libfwnt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "./runtests.sh"
  end
end
