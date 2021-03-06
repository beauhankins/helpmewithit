class Post < ActiveRecord::Base

 scope :active, -> {where.not(:task_done => true)}

  #geocoded_by :address #can also be an IP address
  # after_validation :geocode, :if => :address_changed?

	include PgSearch

	POST_TYPES= %w[Cleaning Pets Cooking Shopping Transport Gardening Technology Admin Languages Caring Virtual Handyman]
	validates :title, :description, :explanation, :location, presence: true

  

  mount_uploader :postpic, PostpicUploader


filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :post_category,
      :post_date
    ]
  )

  # ActiveRecord association declarations

  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  
  pg_search_scope :search_query, 
  :against => [:description, :title], 
  :order_within_rank => "posts.updated_at DESC",
  :using =>{
  	:tsearch => {:prefix => true}
  }

   scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      reorder("posts.created_at #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
   scope :post_category, lambda { |category_ids|
    where("posts.category ilike ?", category_ids)
  }
   scope :post_date, lambda { |post_date|
    where('posts.created_at >= ?', post_date)
  }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.


    def similar_posts
    query= "SELECT p.id, ts_rank_cd(to_tsvector('english', p.description), replace(plainto_tsquery(original.description)::text, ' & ', ' | ')::tsquery) AS similarity
            FROM posts p,
            (SELECT description, id FROM posts WHERE id = ? LIMIT 1) AS original
            WHERE p.id != original.id
            ORDER BY similarity DESC
            LIMIT 3;"

    sim_ids = Post.find_by_sql( [query,self.id] )
    similar_array = Post.find(sim_ids)
    return similar_array
    end


  def self.options_for_sorted_by
    [
      ['Newest first', 'created_at_desc'],
      ['Oldest first', 'created_at_asc'],
    ]
  end
  
  def self.options_for_post_category
    	[	['Any' , '%'],
      		['Cleaning', 'Cleaning'],
      		['Pets', 'Pets'],
      		['Cooking', 'Cooking'],
      		['Shopping', 'Shopping'],
      		['Transport', 'Transport'],
          ['Gardening','Gardening'],
          ['Technology','Technology'],
          ['Personal Admin','Admin'],
          ['Language','Languages'],
          ['Caring','Caring'],
          ['Virtual','Virtual'],
          ['Handyman','Handyman'],
          ['Other','Other']
    	]

    end
  def self.options_for_post_date
      [   ['Any' , ''],
          ['Last week', Time.now - 7.day],
          ['Last 2 weeks', Time.now - 14.day],
          ['Last 30 days', Time.now - 30.day],
      ]
    end

end








