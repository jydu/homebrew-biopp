class Maffilter < Formula
  homepage "http://bioweb.me/maffiter"
  url "https://github.com/jydu/maffilter/archive/v1.2.1.tar.gz"
  sha256 "1631bb2af9273c8830f1df4c02ca561c6a03bcc29e5d37074e2d3c26ae557111"

  depends_on "cmake" => :build
  depends_on "libbpp-phyl-omics"
  depends_on "boost"
  depends_on "libzip"
 
  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "maffilter"
  end
end
