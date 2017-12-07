class LibbppQt < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-qt/releases/tag/v2.3.1"
  sha256 "d0b4fbaf6ff03a003ea37c3c7d5d4b3bc171918d3974280756db0ae9c215b198"
 
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
