module ApplicationHelper

  def image_by_file_type(file_type)
    images =
      {
        Disk::PERMITTED_EXTENTIONS[0] => "zip.svg",
        Disk::PERMITTED_EXTENTIONS[1] => "xls.svg",
        Disk::PERMITTED_EXTENTIONS[2] => "doc.svg"
      }

    image_tag asset_pack_path("media/images/#{images[file_type]}")
  end
end
