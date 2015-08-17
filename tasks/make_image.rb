require 'open4'
require 'FileUtils'

module Tasks

  IN_PATH = ENV['SCAN_IN_PATH'] || '/Users/eliotj/Documents/Temp/image-conversion/in/'
  SCAN_PT_ROOT_PATH = ENV['SCAN_PT_ROOT_PATH'] || '/Users/eliotj/Documents/Temp/image-conversion/data/pairtree_root'

  def self.get_pt_path item_id
    path = ""

    # split in chunks of two
    # TODO: map, flatten, etc...
    item_id.scan(/.{1,2}/).each {|seg| path << '/' + seg}
    PT_ROOT + path
  end

  def self.node_exists? item_id
    path = self.get_pt_path item_id
    File.directory? path
  end

  def self.create_node item_id
    unless self.node_exists? item_id
      path = self.get_pt_path item_id
      FileUtils::mkdir_p path
    end
  end

  def self.make_jp2 tiff_path, jp2_path

    command = "kdu_compress \
      -i #{tiff_path}  \
      -o #{jp2_path} \
      -rate 1.2,0.7416334477,0.4583546103,0.2832827752,0.1750776907,0.1082041271,0.0668737897,0.0413302129 \
       Creversible=yes Clevels=7 Cblk=\\{64,64\\} \
      -jp2_space sRGB \
       Cuse_sop=yes Cuse_eph=yes Corder=RLCP ORGgen_plt=yes ORGtparts=R \
       Stiles=\\{1024,1024\\} \
      -double_buffering 10 \
      -no_weights \
      -quiet"

    status = Open4::popen4(command) do |pid, stdin, stdout, stderr|
      puts "PID #{pid}" 
    end

    if $?.success?
      true     
    else

      # delete leftover file
      FileUtils.rm(jp2_path)
      false
    end
  end

  def self.get_in_files
    Dir.glob(IN_PATH + '*.tif').map { |file| File.basename(file, '.tif') }
  end

  def self.run
    self.get_in_files.each do | item_id |
      unless self.node_exists? item_id 
        self.create_node item_id
      end

      # TODO: check if ark is in database
      
      # TODO: create geoblacklight.json and move it to folder

      out_path = self.get_pt_path item_id 
      in_tiff = IN_PATH + item_id + '.tif'
      out_jp2 =  out_path + '/' + item_id + '.jp2'

      # make jp2
      puts in_tiff
      puts out_jp2
      
      if self.make_jp2 in_tiff, out_jp2
        
        # move source image to processed dir
        proc_path = IN_PATH + 'processed'
        FileUtils::mkdir_p proc_path unless File.directory? proc_path
        FileUtils.mv(in_tiff, proc_path + '/' + item_id + '.tif') 
      end

    end
  end
end