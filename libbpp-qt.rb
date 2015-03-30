class LibbppQt < Formula
  homepage "http://biopp.univ-montp2.fr/"
  url "http://biopp.univ-montp2.fr/repos/sources/bpp-qt-2.2.0.tar.gz"
  sha256 "9662f66bc3491d8e128263f6bd91fcdbecdb375ec9f24519f44855cdcdb9d553"

  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "libbpp-phyl"

  def install
    system "cmake", ".", *std_cmake_args, "-DBUILD_TESTING=no"
    system "make", "install"
  end
end
