class LibbppCore < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-core-2.2.0.tar.gz"
  sha256 "aacd4afddd1584ab6bfa1ff6931259408f1d39958a0bdc5f78bf1f9ee4e98b79"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
