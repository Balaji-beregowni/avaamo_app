class AttachmentsController < ApplicationController

  def index
    raise NotImplementedError
  end

  def csv_status
    attachment = Attachment.find(params[:id])
    file_relative_path = attachment.file_path.split('/').last
    # if file is ready to download then the file to FE,
    #if not send status so FE sends request in sometime
    if attachment.status == 'completed'
      render json: {
        path: file_relative_path,
        status: attachment.status
      }
      return
    else
      render json: { status: attachment.status }
    end
  end
end


