
class ScbiZcatFile

	def self.gz_file?(file_name)
		res=`file -L "#{File.expand_path(file_name)}"`

		return !res.index('gzip').nil?
	end

	def initialize(file_name)
		@file_name=file_name
		open_file
	end

	def open_file
		cmd="zcat \"#{File.expand_path(@file_name)}\""
		#puts "OPEN: #{cmd}"
		@file = IO.popen(cmd)
		#@file.close_write
		@eof=false
	end

	def readline
		begin
		res = @file.readline
		rescue IOError
			close
		end

		return res
	end

	def eof?
		@file.eof?
	end

	def eof
		eof?
	end

	def close
		#@io.finish
		@file.close if !@file.closed?
	end

	def rewind
		close
		open_file
	end

end
