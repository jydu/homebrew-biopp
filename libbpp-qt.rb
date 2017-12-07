class LibbppQt < Formula
  desc "Bio++ Sequence Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-qt/releases/tag/v2.3.1"
  sha256 "3c1df854bdd694014156c37c0f84930230143e97a089cd065230d127191435c7"
 
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
