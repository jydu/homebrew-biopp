class Bppphyview < Formula
  desc "The Bio++ Phylogenetic Viewer"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bppphyview/archive/v0.6.0.tar.gz"
  sha256 "160d66cacd0718cbb75a946e7274f2fa5ada2fb042f65cd7877efa2e12bc0de1"
  
  depends_on "cmake" => :build
  depends_on "libbpp-qt"
 
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "phyview"
  end
end
