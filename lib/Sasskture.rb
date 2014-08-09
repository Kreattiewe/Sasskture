require "Sasskture/version"

module Sasskture
  class GenerateStructure

  	attr_reader :maintext

  	def initialize
  		@maintext = ""
  	end
  	###
  	# Structure files
  	def files
  		return [
  			{
		      :folder => "helpers",
		      :description => "// Sass utilities",
		      :files => ["variables", "functions", "mixins", "helpers"]
		    },
		    {
		    	:folder => "vendors",
		    	:description => "// Vendors and external stylesheets",
		    	:files => []
		    },
		    {
		      :folder => "base", 
		      :description => "// Base stuff",
		      :files => ["reset", "typography"]
		    },
		    {
		      :folder => "layout", 
		      :description => "// Layout related stylesheets",
		      :files => ["grid", "header", "footer"]
		    }
		  ]
  	end

  	###
  	# Simple map to read data
  	def generateData
  		files.each do |folder|
  			createFolder folder[:folder]
  			@maintext += folder[:description] + "\n"
  			folder[:files].each do |file|
  				createFile folder[:folder], file
  				@maintext += "@import '" + folder[:folder] + "/" + file + "';\n"
  			end
  			@maintext += "\n"
  		end
  	end

  	###
  	# Generate folder
  	def createFolder(name)
  		system 'mkdir', '-p', name
  	end

  	###
  	# Generate files
  	def createFile(folderName, folderFile)
  		system 'touch', "#{folderName}/_#{folderFile}.scss"
  	end

  	##
  	# Generate main
  	def generateMain
  		system 'touch', 'app.scss'
  		File.open('app.scss', "wb") { |file| file.write(@maintext) }
  	end

  end
end