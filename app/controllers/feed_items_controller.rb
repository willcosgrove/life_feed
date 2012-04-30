class FeedItemsController < ApplicationController
  # GET /feed_items
  # GET /feed_items.json
  def index
    @feed_items = FeedItem.order('created_at desc').limit(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_items }
    end
  end

  # POST /feed_items
  # POST /feed_items.json
  def create
    @feed_item = FeedItem.new(params[:feed_item])

    respond_to do |format|
      if @feed_item.save
        format.html { redirect_to @feed_item, notice: 'Feed item was successfully created.' }
        format.json { render json: @feed_item, status: :created, location: @feed_item }
      else
        format.html { render action: "new" }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def github
    author = params['payload']['commits'][0]['author']['name']
    repo_name = params['payload']['repository']['name']
    commits = params['payload']['commits']
    @feed_item = FeedItem.new(source: 'github')
    @feed_item.title = "#{repo_name} updated"
    @feed_item.subtitle = "by #{author}"
    @feed_item.message = "#{author} pushed #{help.pluralize(commits.size, 'new commit')} to #{repo_name}"
    @feed_item.save
  end
end
