class StyleFinderService

  attr_reader :start_date, :end_date

  def initialize(params, company)
    @params = params
    @sort_by = params[:sort_by]
    @sort_direction = params[:sort_direction]
    @filters = params[:filters]
    @current_company = company
    @start_date = format_date(params, :beginning, Date.current.beginning_of_month)
    @end_date = format_date(params, :end, Date.current.end_of_month)
  end

  def perform
    @styles = @current_company.styles.includes(:attachments, product_set: :user).paginate(page: @params[:page], per_page: 20)

    filter
    sort
    return @styles
  end


  private

    def sort
      if @sort_by.present?
        @styles = @styles.order("#{@sort_by} #{@sort_direction}") if @styles
      end
    end

    def filter
      return unless @filters
      filter_by_product_set_name
      filter_by_status
      filter_by_style_number
      filter_by_buyer_name
      filter_by_style_delivery_year
      filter_by_style_delivery_month
      filter_by_style_scout_year
      filter_by_style_scout_month
    end

    # TODO needs finishing to account for scout_date living on appts table
    def filter_by_style_scout_year
      if @filters[:scout_year].present? && @filters[:scout_year] != "null"
        @styles = @styles.where('extract(year from scout_date) = ?', @filters[:scout_year])
      else
        @styles = @styles
      end

      return @styles
    end

    def filter_by_style_scout_month
      if @filters[:scout_month].present? && @filters[:scout_month] != "null"
        @styles = @styles.where('extract(month from scout_date) = ?', @filters[:scout_month])
      else
        @styles = @styles
      end

      return @styles
    end

    def filter_by_style_delivery_year
      if @filters[:delivery_year].present? && @filters[:delivery_year] != "null"
        @styles = @styles.where('extract(year from delivery_date) = ?', @filters[:delivery_year])
      else
        @styles = @styles
      end

      return @styles
    end

    def filter_by_style_delivery_month
      if @filters[:delivery_month].present? && @filters[:delivery_month] != "null"
        @styles = @styles.where('extract(month from delivery_date) = ?', @filters[:delivery_month])
      else
        @styles = @styles
      end

      return @styles
    end

    def filter_by_product_set_name
      if @filters[:product_set_name].present?
         @styles = @styles.includes(:product_set).where(product_sets: { name: @filters[:product_set_name] })
      end

      return @styles
    end

    def filter_by_status
      if @filters[:status].present?
         @styles = @styles.where(status: @filters[:status])
      end

      return @styles
    end

    def filter_by_style_number
      if @filters[:vendor_style_number].present?
        @styles = @styles.where('vendor_style_number ilike ?', "%#{@filters[:vendor_style_number]}%")
      end

      return @styles
    end

    def filter_by_buyer_name
      if @filters[:user_id].present?
        @styles = @styles.includes(:product_set).where(product_sets: { user_id: @filters[:user_id] })
      end

      return @styles
    end

  protected

    def format_date(params, period, default)
      return default unless params[:merch_month].present? && params[:merch_year].present?
      DateTime.new(params[:merch_year].to_i, params[:merch_month].to_i).send("#{period}_of_month")
    end

end
