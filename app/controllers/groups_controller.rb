class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end
  def edit; end
  def create; end
  def update; end
end
