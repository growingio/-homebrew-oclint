# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OclintGrowing < Formula
  desc "oclint version 0.15 support , growing rule add"
  homepage "http://oclint.org"
  url "https://github.com/growingio/oclint-growing/releases/download/v1.2/oclint-growing.zip"
  sha256 "730ebcf21e769fff4bc64881090413bee3e4011fcb4c10297161d22db46c59f2"
  license ""

  # depends_on "cmake" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    clang_version = '10.0.0'

    include.install Dir['include/c++'] unless File.directory? "#{include}/c++"
    "#{include}/c++".install Dir['include/c++/v1'] unless File.directory? "#{include}/c++/v1"
    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']

  end

end
