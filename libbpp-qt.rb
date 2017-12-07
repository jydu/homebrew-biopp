class LibbppQt < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-qt/releases/tag/v2.3.1"
  sha256 "093b7915507f38a091eba69e93642e6a4f87178804a8ee017e1b732626793d48"

  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "libbpp-phyl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "bpp-qt-shared", "bpp-qt-static"
      system "make", "install"
    end
  end
end
