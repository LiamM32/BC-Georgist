require 'kramdown'
require 'erb'

# Define the template file path
template_path = 'template.html.erb'

# Get a list of Markdown files in the 'articles/' directory
markdown_files = Dir.glob('articles/*.md')

# Define the base directory
base_dir = File.expand_path(File.dirname(__FILE__))

# Loop through each Markdown file
markdown_files.each do |markdown_file|
  # Read the Markdown content
  markdown_content = File.read(markdown_file)

  # Convert Markdown to HTML using Kramdown
  html_content = Kramdown::Document.new(markdown_content, input: 'GFM').to_html

  # Read the ERB template
  erb_template = ERB.new(File.read(template_path))

  # Define variables to pass to the template
  # You can include any dynamic content here
  title = markdown_content.lines.first.gsub(/^#\s+/, '').strip
  article_content = html_content

  # Render the template
  result = erb_template.result(binding)

  # Define the output HTML file path (e.g., based on the input filename)
  output_file = markdown_file.gsub('articles/', 'articles-html/').gsub('.md', '.html')

  # Write the result to the output HTML file
  File.write(output_file, result)

  puts "Cached #{markdown_file} as #{output_file}"
end
