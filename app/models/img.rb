class Img < ApplicationRecord
  include ImgUploader[:image]
end
