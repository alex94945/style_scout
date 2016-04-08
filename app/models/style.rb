class Style < ActiveRecord::Base
	belongs_to :appointment
      enum status: [ :created, :approved, :order_placed, :received, :cancelled, :deleted ]

      has_many :attachments


	def initial_mark_up
		return 0 unless retail_price.present?
		( ( (retail_price) - wholesale_or_negotiated_cost) / retail_price ) * 100
	end

	def self.to_csv
          attributes = %w{id name vendor_style_number quantity color created_at updated_at notes negotiated_cost retail_price wholesale_cost category_name delivery_date status}

          CSV.generate(headers: true) do |csv|
              csv << attributes
              all.each do |style|
                csv << [ 
                		style.id, 
                		style.name, 
                		style.vendor_style_number,
                		style.quantity, 
                		style.color,
                		style.created_at.strftime("%Y-%m-%d"),
                		style.updated_at,
                		style.notes,
                		style.negotiated_cost,
                		style.retail_price,
                		style.wholesale_cost,
                		style.category_name,
                		style.delivery_date,
                		style.status
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