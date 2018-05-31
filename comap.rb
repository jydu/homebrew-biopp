class Comap < Formula
  homepage "http://bioweb.me/comap"
  url "https://github.com/jydu/comap/archive/v1.5.5.tar.gz"
  sha256 "97b82a38c06541bbdefc31308cfee258afd0a989ad192389b3171db8b5c809d0"
  depends_on "cmake" => :build
  depends_on "libbpp-phyl"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "comap"
    system "mica"
  end
end
