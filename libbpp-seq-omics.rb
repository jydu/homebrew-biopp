class LibbppSeqOmics < Formula
  desc "Bio++ Sequence Library - Omics components"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-seq-omics/archive/v2.4.1.tar.gz"
  sha256 "200da925b42065998d825f0b2a37e26b00a865883c85bc332beb3a94cae1e08b"

  depends_on "cmake" => :build
  depends_on "libbpp-seq"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"bpp-test.cpp").write <<-EOS.undent
#include <Bpp/Seq/Io/Fastq.h>
#include <Bpp/Seq/SequenceWithQuality.h>
#include <Bpp/Seq/Alphabet/DNA.h>

using namespace bpp;

int main () {
  Fastq fq;
  const Alphabet* alpha = new DNA();
  SequenceWithQuality seq("", "", alpha);
  return 0;
}
EOS
    libs = %w[-lbpp-core -lbpp-seq -lbpp-seq-omics]
    system ENV.cxx, "-o", "test", "bpp-test.cpp",
           "-I#{include}", "-L#{lib}", *libs
    system "./test"
  end
end
