class LibbppPopgen < Formula
  desc "Bio++ Population Genetics Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-popgen/archive/v2.4.0.tar.gz"
  sha256 "7002ca10192e1b2a3c0a97e0091c416829f1e598540fc41c493e4f73a7ed8375"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
