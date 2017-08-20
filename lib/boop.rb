require "boop/version"
require "securerandom"

class Boop
  def initialize(base_url, repo_dir)
    @base_url = base_url
    @repo_dir = File.expand_path(repo_dir)
  end

  def paste(name, contents)
    save(:txt, name, contents)
  end

  def html(name, contents)
    save(:html, name, contents)
  end

  def file(name, contents)
    save_file(name, contents)
  end

  private
  def save(file_extension, name, contents)
    name ||= SecureRandom.uuid.tr('-i', '')

    filename = "#{name}.#{file_extension}"

    save_file(filename, contents)
  end

  def save_file(filename, contents)
    path = File.join(@repo_dir, filename)

    File.open(path, 'w') { |f| f.write contents }

    commit_and_push!(filename)

    print_url(filename)
  end

  def commit_and_push!(filename)
    Dir.chdir(@repo_dir) do
      `git add #{filename}`
      `git commit -q -m "Add paste: #{filename}"`
      `git push -q`
    end
  end

  def print_url(filename)
    puts "#{@base_url}/#{filename}"
  end
end
