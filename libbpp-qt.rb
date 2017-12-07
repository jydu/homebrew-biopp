class LibbppQt < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-qt/releases/tag/v2.3.1"
  sha256 "4f7c659970c3d1c2995a2584b50851b81468c5246622c69e725997574a605da6"
  
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
