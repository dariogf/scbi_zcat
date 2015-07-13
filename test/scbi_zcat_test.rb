require File.dirname(__FILE__) + '/test_helper.rb'

class ScbiMultiGzReaderTest < Test::Unit::TestCase

  def setup

  end

  def test_zcat

    # test a file with multiple gz streams

    #file=ScbiZcatFile.new('/tmp/pair2.fastq.gz')
    file=ScbiZcatFile.new(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    
    i=0
    printing=0

    loop do
      res=file.readline

      break if res.nil?
      # #puts res
      # if res.index('M00707:28:000000000-AFRC1:1:1102:16433:15968')
      #   printing=10
      # end
      # if printing>0
      #   puts res
      #   #sleep 2
      #   printing-=1
      # end

      
      i = i+1
    end

    file.close

    #assert_equal(2813668,i)
    assert_equal(28,i)

  end
  
  def test_zcat_while

    # test a file with multiple gz streams

    #file=ScbiZcatFile.new('/tmp/pair2.fastq.gz')
    file=ScbiZcatFile.new(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    
    i=0
    printing=0

    begin
      res=file.readline

      assert_equal(false,res.nil?)
      
      i = i+1
    end while !file.eof?

    file.close

    #assert_equal(2813668,i)
    assert_equal(28,i)

  end

  def test_gz_file?

    # test a file with multiple gz streams

    res=ScbiZcatFile.gz_file?(File.join(File.dirname(__FILE__),'minitest.fastq.gz'))
    assert_equal(true,res)
    
    res=ScbiZcatFile.gz_file?(File.join(File.dirname(__FILE__),'minitest.fastq'))
    assert_equal(false,res)
    

  end
  
end
