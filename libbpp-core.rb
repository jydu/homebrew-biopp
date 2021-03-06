class LibbppCore < Formula
  desc "Bio++ Core Library"
  homepage "http://bioweb.me/biopp"
  url "https://github.com/BioPP/bpp-core/archive/v2.4.1.tar.gz"
  sha256 "1150b8ced22cff23dd4770d7c23fad11239070b44007740e77407f0d746c0af6"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"bpp-test.cpp").write <<-EOS.undent
      #include <Bpp/Numeric/Matrix/Matrix.h>
      #include <Bpp/Numeric/Matrix/MatrixTools.h>
      #include <vector>
      #include <iostream>

      using namespace bpp;
      using namespace std;

      int main() {
        RowMatrix<double> m(2,2);
        m(0,0) = 2.3;
        m(0,1) = 1.4;
        m(1,0) = 5.0;
        m(1,1) = -0.9;
        EigenValue<double> eigen(m);
        RowMatrix<double> D  = eigen.getD();
        const vector<double> L  = eigen.getRealEigenValues();
        RowMatrix<double> V1 = eigen.getV();
        RowMatrix<double> V2;
        MatrixTools::inv(V1, V2);
        MatrixTools::mult(V1, L, V2, test);
        return (test.equals(m) ? 0 : 1);
      }
    EOS
    libs = %w[-lbpp-core]
    system ENV.cxx, "-o", "test", "bpp-test.cpp",
           "-I#{include}", "-L#{lib}", *libs
    system "./test"
  end
end
