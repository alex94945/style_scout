class Style < ActiveRecord::Base
	belongs_to :appointment
      enum status: [ :created, :approved, :order_placed, :received, :cancelled, :deleted ]

      has_many :attachments, dependent: :destroy
      has_many :variations, dependent: :destroy

      validates :vendor_style_number, presence: true

      scope :open, -> { where(status: [0,1,2,3]) }


	def initial_mark_up
		return 0 unless retail_price.present?
		( ( (retail_price) - wholesale_or_negotiated_cost) / retail_price ) * 100
	end

	def self.to_csv
          attributes = %w{Vendor_Style_Number Quantity Status Color Created 
                              Negotiated_Cost Retail_Price Wholesale_Cost Category_Name Delivery_Date Notes}

          CSV.generate(headers: true) do |csv|
              csv << attributes
              all.each do |style|
                csv << [ 
                		style.vendor_style_number,
                		style.quantity,
                      style.status,
                		style.color,
                		style.created_at.strftime("%Y-%m-%d"),
                		style.negotiated_cost,
                		style.retail_price,
                		style.wholesale_cost,
                		style.category_name,
                		style.delivery_date,
                		style.notes
                	]

              end
          end
      end

      def default_photo(size= 'original')
        
        return nil unless attachments.any?
        if default_photo_id
          attachments.find(default_photo_id).photo.url(size)
        else
          attachments.first.photo.url(size)
        end

      end



	private 
		def wholesale_or_negotiated_cost
			negotiated_cost.present? ? negotiated_cost : wholesale_cost || 0
		end
end