class LibbppPopgen < Formula
  desc "Bio++ Population Genetics Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-popgen/archive/v2.4.1.tar.gz"
  sha256 "03b57d71a63c8fa7f11c085e531d0d691fc1d40d4ea541070dabde0ab3baf413"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
