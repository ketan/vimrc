desc "initialize the .vim directory"
task :init do
  %w(~/.vim ~/.vim/autoload ~/.vim/bundle ~/.vim/backup).each { |x| mkdir_p File.expand_path(x) }
end

desc "installs pathogen"
task :install_pathogen do
  curl 'https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim', '~/.vim/autoload/pathogen.vim'
end

desc "clone all repos"
task :clone
{
   "ack"                => "git://github.com/mileszs/ack.vim.git",
   "chef"               => "git://github.com/t9md/vim-chef.git",
   "color-sampler"      => "git://github.com/vim-scripts/Color-Sampler-Pack.git",
   "cucumber"           => "git://github.com/tpope/vim-cucumber.git",
   "endwise"            => "git://github.com/tpope/vim-endwise.git",
   "fugitive"           => "git://github.com/tpope/vim-fugitive.git",
   "gist-vim"           => "git://github.com/mattn/gist-vim.git",
   "git"                => "git://github.com/tpope/vim-git.git",
   "gundo"              => "git://github.com/sjl/gundo.vim.git",
   "haml"               => "git://github.com/tpope/vim-haml.git",
   "indent_object"      => "git://github.com/michaeljsmith/vim-indent-object.git",
   "irblack"            => "git://github.com/wgibbs/vim-irblack.git",
   "javascript"         => "git://github.com/pangloss/vim-javascript.git",
   "markdown"           => "git://github.com/tpope/vim-markdown.git",
   "nerdcommenter"      => "git://github.com/ddollar/nerdcommenter.git",
   "nerdtree"           => "git://github.com/wycats/nerdtree.git",
   "puppet"             => "git://github.com/ajf/puppet-vim.git",
   "rails"              => "git://github.com/tpope/vim-rails.git",
   "ruby"               => "git://github.com/vim-ruby/vim-ruby.git",
   "rspec"              => "git://github.com/taq/vim-rspec.git",
   "rvm"                => "git://github.com/tpope/vim-rvm.git",
   "scala"              => "git://github.com/bdd/vim-scala.git",
   "searchfold"         => "git://github.com/vim-scripts/searchfold.vim.git",
   "snipmate"           => "git://github.com/msanders/snipmate.vim.git",
   "snipmate-snippets"  => "git://github.com/scrooloose/snipmate-snippets.git",
   "solarized"          => "git://github.com/altercation/vim-colors-solarized.git",
   "surround"           => "git://github.com/tpope/vim-surround.git",
   "syntastic"          => "git://github.com/scrooloose/syntastic.git",
   "tagbar"             => "git://github.com/majutsushi/tagbar.git",
   "taglist"            => "git://github.com/vim-scripts/taglist.vim.git",
   "textile"            => "git://github.com/timcharper/textile.vim.git",
   "unimpaired"         => "git://github.com/tpope/vim-unimpaired.git",
   "coffee-script"      => "git://github.com/kchmck/vim-coffee-script.git",
   "vividchalk"         => "git://github.com/tpope/vim-vividchalk.git",
   "zoomwin"            => "git://github.com/vim-scripts/ZoomWin.git",
   # "align"            =>   "git://github.com/tsaleh/vim-align.git",
   # "conque"           =>   "http://conque.googlecode.com/files/conque_1.1.tar.gz",
   # "supertab"         =>   "git://github.com/ervandew/supertab.git",
  }.each do |name, repo|

    desc "install #{name}"
    task name do
      puts "*** Installing #{name}"
      git_clone repo, "~/.vim/bundle/#{name}"
    end

    task :clone => name
end

desc "install command_t"
task :command_t do
  git_clone "git://github.com/wincent/Command-T.git", "~/.vim/bundle/command-t" do
    sh "rake make"
  end
end
task :clone => :command_t

desc "install diff-syntax"
task :"diff-syntax" do
  dir = File.expand_path("~/.vim/bundle/diff-syntax/after/syntax")
  mkdir_p dir
  curl 'https://raw.github.com/gist/1403515/80824c18942ed8fbb2ff8b788ca5b7389f31b78f/diff.vim', "#{dir}/diff.vim"
end
task :clone => :"diff-syntax"

desc "install vimrc"
task :install_vimrc do
  %w(vimrc gvimrc vimrc.nerdtree).each do |file|
    dest = File.expand_path("~/.#{file}")
    rm_f  dest
    ln_s  File.expand_path("../#{file}", __FILE__), dest
  end
end

desc "default"
task :default => [:init, :install_pathogen, :install_vimrc, :clone]

desc "clean"
task :clean do
  rm_rf File.expand_path('~/.vim')
end


def curl(url, dest)
  dest = File.expand_path(dest)
  sh "curl #{url} > #{dest}" unless File.exist?(dest)
end

def git_clone(repo, dest, &block)
  dest = File.expand_path(dest)
  unless File.exist?(dest)
    sh "git clone #{repo} #{dest}"
  else
    sh "cd #{dest} && git pull" if ENV['GIT_PULL']
  end
  if block_given?
    cd dest do
      yield
    end
  end
end
