module PostAttachmentsHelper

  def converttomb(filesizeinbytes)
    number_with_precision(filesizeinbytes/(1048576.000), :precision =>3)
  end
  
end
