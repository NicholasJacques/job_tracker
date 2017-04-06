class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.order(:title)
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    @categories = Category.order(:title)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
    @categories = Category.order(:title)
  end

  def update
    @job = Job.find(params[:id])
    @categories = Category.order(:title)
    if @job.update(job_params)
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path(@job.company)
  end

  def root
    if params["sort"] == "location"
      byebug
      render :location
    elsif params["sort"] == "interest"
      render :interest
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
