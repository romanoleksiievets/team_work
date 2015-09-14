class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [ :destroy, :download]
  before_action :set_project

  def create
    @attachment = @project.attachments.build(attachment_params)
    @attachment.owner = current_user
    if @attachment.save
      redirect_to @project, notice: 'You have successfully added file /Ви успішно добавили файл'
    else
      flash[:alert] = 'You can`t add this file'
      redirect_to @project
    end
  end

  def destroy
    @attachment.destroy
    redirect_to @project , notice: 'Attachment was successfully destroyed.'
  end

  def download
    send_file @attachment.attachment.path,
                :filename => @attachment.attachment_file_name,
                :type => @attachment.attachment_content_type,
                :disposition => 'attachment'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @project = Project.find(params[:project_id])
      @attachment = @project.attachments.find(params[:id])
      @attachment.owner
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit( :attachment)
    end
end
