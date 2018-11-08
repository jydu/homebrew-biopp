class LibbppQt < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-qt/archive/v2.4.1.tar.gz"
  sha256 "4423b35223415c6dc6b483df3cf3276dafabd93c04dfc4716ce0b8e5b3ea219b"
 
  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "libbpp-phyl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
