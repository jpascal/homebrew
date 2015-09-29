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
end
