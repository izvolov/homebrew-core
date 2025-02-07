require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.30.54.tgz"
  sha256 "679762804b4fb7b51b216dc3c0913b0c9dc36989985d0c7131d4d06636a1d02d"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d31c3d6d4b66074792b9434d608f9fa2f95152856ba4fcffcda7b99c79c2ae77"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "d31c3d6d4b66074792b9434d608f9fa2f95152856ba4fcffcda7b99c79c2ae77"
    sha256 cellar: :any_skip_relocation, monterey:       "1eb16717cdb7439cfee0d3eb2754243046b359ff5ce2efa1a888a5ddf3a1c449"
    sha256 cellar: :any_skip_relocation, big_sur:        "1eb16717cdb7439cfee0d3eb2754243046b359ff5ce2efa1a888a5ddf3a1c449"
    sha256 cellar: :any_skip_relocation, catalina:       "1eb16717cdb7439cfee0d3eb2754243046b359ff5ce2efa1a888a5ddf3a1c449"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d31c3d6d4b66074792b9434d608f9fa2f95152856ba4fcffcda7b99c79c2ae77"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
