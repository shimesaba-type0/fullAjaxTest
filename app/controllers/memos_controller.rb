class MemosController < ApplicationController
  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memos }
    end
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
    @memo = Memo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @memo }
    end
  end

  # GET /memos/new
  # GET /memos/new.json
  def new
    @memo = Memo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @memo }
    end
  end

  # GET /memos/1/edit
  def edit
    @memo = Memo.find(params[:id])
  end

  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(params[:memo])

    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render json: @memo, status: :created, location: @memo }
      else
        format.html { render action: "new" }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /memos/1
  # PUT /memos/1.json
  def update
    @memo = Memo.find(params[:id])

    if @memo.update_attributes(params[:memo])
      status = 'success'
    else
      status = 'error'
    end

    render json: { status: status, data: @memo }
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy

    respond_to do |format|
      format.html { redirect_to memos_url }
      format.json { head :no_content }
    end
  end
end
