class NotesController < ApplicationController

	def new
		@note = current_user.notes.new
	end

	def create
		@note = current_user.notes.new(note_params)

		if @note.save
			redirect_to :root
		else
			render 'new'
		end
	end

	def show
		# todo make sure user is authorized to see this note
		@note = Note.find(params[:id])
	end

	private
	def note_params
		params.require(:note).permit(:title, :description, :content)
	end

end
