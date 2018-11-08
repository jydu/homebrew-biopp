class LibbppPhylOmics < Formula
  desc "Bio++ Phylogenetics Library - Omics components"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-phyl-omics/archive/v2.4.1.tar.gz"
  sha256 "fb0908422e59c71065db874e68d5c71acddf66d8a51776f7e04a5f8d5f0f6577"

  depends_on "cmake" => :build
  depends_on "libbpp-seq-omics"
  depends_on "libbpp-phyl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
